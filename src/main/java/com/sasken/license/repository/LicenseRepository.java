package com.sasken.license.repository;

import com.sasken.license.model.License;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface LicenseRepository extends JpaRepository<License, Long> {
    List<License> findByEndDateBeforeAndStatus(LocalDateTime now, License.Status status);
    List<License> findByStatus(License.Status status);

}
