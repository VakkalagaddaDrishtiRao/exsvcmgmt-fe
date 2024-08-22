package com.security.security.service;

import com.security.security.model.AppUser;
import com.security.security.model.PersonalDetails;
import com.security.security.model.ProfessionalDetails;
import com.security.security.repository.AppUserRepository;
import com.security.security.repository.PersonalDetailsRepository;
import com.security.security.repository.ProfDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class DataService {

    @Autowired
    private AppUserService userService;

    @Autowired
    private PersonalDetailsRepository pdRepo;

    @Autowired
    private ProfDetailsRepository profDetailsRepository;

    @Autowired
    private AppUserRepository userRepo;

    public String addPersonalDetails(PersonalDetails personalDetails) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        AppUser user = userService.findByEmail(email);
        PersonalDetails details = pdRepo.save(personalDetails);
        System.out.println("Personal Details" + details);
        user.setPersonalDetails(details);
        AppUser userPersonal = userRepo.save(user);
        return "PERSONAL DATA ADDED";
    }

    public String addProfDetails(ProfessionalDetails professionalDetails) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        AppUser user = userService.findByEmail(email);
        ProfessionalDetails details = profDetailsRepository.save(professionalDetails);
        System.out.println("Personal Details" + details);
        user.setProfessionalDetails(details);
        AppUser userProf = userRepo.save(user); // Save the updated user
        return "PROFESSIONAL DATA ADDED";
    }
}
