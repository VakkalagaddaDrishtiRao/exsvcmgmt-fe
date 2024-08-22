package com.security.security.repository;

import com.security.security.model.Documents;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DocumentsRepository extends JpaRepository<Documents, Long> {
}
