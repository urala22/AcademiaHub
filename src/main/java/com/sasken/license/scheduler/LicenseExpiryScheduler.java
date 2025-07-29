package com.sasken.license.scheduler;

import com.sasken.license.service.LicenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class LicenseExpiryScheduler {

    @Autowired
    private LicenseService licenseService;

    @Scheduled(cron = "0 0 0 * * ?")
    public void updateExpiredLicensesDaily() {
        licenseService.updateExpiredLicenses();
    }
}
