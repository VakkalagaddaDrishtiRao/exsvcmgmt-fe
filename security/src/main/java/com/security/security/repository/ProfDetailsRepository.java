package com.security.security.repository;

import com.security.security.model.ProfessionalDetails;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProfDetailsRepository extends JpaRepository<ProfessionalDetails, Long> {
}
