package com.sasken.license.service;

import com.sasken.license.model.License;
import com.sasken.license.repository.LicenseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class LicenseService {

    @Autowired
    private LicenseRepository licenseRepo;

    public List<License> getAllLicenses() {
        return licenseRepo.findAll();
    }

    public void allocateLicense(Long id, String user, int days) {
        License license = licenseRepo.findById(id).orElseThrow();
        license.setAssignedTo(user);
        license.setStartDate(LocalDateTime.now());
        license.setEndDate(LocalDateTime.now().plusDays(days));
        license.setStatus(License.Status.ASSIGNED);
        licenseRepo.save(license);
    }
    
    public List<License> getAvailableLicenses() {
        return licenseRepo.findByStatus(License.Status.AVAILABLE);
    }
    
    
    public void updateExpiredLicenses() {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime threshold = now.minusDays(1);

        // Fetch all licenses with EXPIRED status
        List<License> expiredLicenses = licenseRepo.findByStatus(License.Status.EXPIRED);
        for (License license : expiredLicenses) {
            if (license.getEndDate() != null && license.getEndDate().isBefore(threshold)) {
                // If the license has been expired for more than 1 day, make it AVAILABLE
                license.setStatus(License.Status.AVAILABLE);
                license.setAssignedTo(null);
                license.setStartDate(null);
                license.setEndDate(null);
                licenseRepo.save(license);
            }
        }
    }




    public void releaseExpiredLicenses() {
        List<License> expiredLicenses = licenseRepo.findByEndDateBeforeAndStatus(LocalDateTime.now(), License.Status.ASSIGNED);
        for (License license : expiredLicenses) {
            license.setStatus(License.Status.EXPIRED);
            license.setAssignedTo(null);
            licenseRepo.save(license);
        }
    }
}
