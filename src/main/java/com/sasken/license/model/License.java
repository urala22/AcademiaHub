package com.sasken.license.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "licenses")
public class License {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "license_key", nullable = false)
    private String licenseKey;

    @Column(name = "assigned_to")
    private String assignedTo;

    @Column(name = "start_date")
    private LocalDateTime startDate;

    @Column(name = "end_date")
    private LocalDateTime endDate;

    @Enumerated(EnumType.STRING)
    private Status status;

    public enum Status { AVAILABLE, ASSIGNED, EXPIRED }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getLicenseKey() { return licenseKey; }
    public void setLicenseKey(String licenseKey) { this.licenseKey = licenseKey; }

    public String getAssignedTo() { return assignedTo; }
    public void setAssignedTo(String assignedTo) { this.assignedTo = assignedTo; }

    public LocalDateTime getStartDate() { return startDate; }
    public void setStartDate(LocalDateTime startDate) { this.startDate = startDate; }

    public LocalDateTime getEndDate() { return endDate; }
    public void setEndDate(LocalDateTime endDate) { this.endDate = endDate; }

    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }
}
