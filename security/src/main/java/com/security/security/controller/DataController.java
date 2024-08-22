package com.security.security.controller;

import com.security.security.model.AppUser;
import com.security.security.model.PersonalDetails;
import com.security.security.model.ProfessionalDetails;
import com.security.security.repository.AppUserRepository;
import com.security.security.service.AppUserService;
import com.security.security.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/secure")
public class DataController {

    @Autowired
    private DataService dataService;



    @PostMapping("/addPersonalData")
    private String addPersonalDetails(@RequestBody PersonalDetails personalDetails){
        System.out.println("Inside Add personnel");
        return dataService.addPersonalDetails(personalDetails);
    }

    @PostMapping("/addProfData")
    private String addProfDetails( @RequestBody ProfessionalDetails professionalDetails){
        System.out.println("Inside Add personnel");
        return dataService.addProfDetails(professionalDetails);
    }
}
