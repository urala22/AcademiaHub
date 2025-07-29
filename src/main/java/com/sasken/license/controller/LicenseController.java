package com.sasken.license.controller;

import com.sasken.license.model.License;
import com.sasken.license.service.LicenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class LicenseController {

    @Autowired
    private LicenseService licenseService;

    // Redirect root URL "/" to "/list"
    @GetMapping("/")
    public String home() {
        return "index";  // Load index.jsp
    }

    @GetMapping("/addLicense")
    public String showAddLicense(Model model) {
        model.addAttribute("licenses", licenseService.getAllLicenses());
        return "addLicense";
    }


    @GetMapping("/list")
    public String listLicenses(Model model) {
        List<License> licenses = licenseService.getAllLicenses();
        model.addAttribute("licenses", licenses);
        return "listLicenses";
    }

    @PostMapping("/allocate/{id}")
    public String allocate(@PathVariable Long id,
                           @RequestParam String user,
                           @RequestParam int days,
                           RedirectAttributes redirectAttributes) {
        licenseService.allocateLicense(id, user, days); // Updates DB and sets status to ASSIGNED
        redirectAttributes.addFlashAttribute("successMessage", "License allocated successfully!");
        return "redirect:/";
    }
 // redirect to list instead of "/"
    }


