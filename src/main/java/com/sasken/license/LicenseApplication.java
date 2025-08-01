package com.sasken.license;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class LicenseApplication {
    public static void main(String[] args) {
        SpringApplication.run(LicenseApplication.class, args);
    }
}
