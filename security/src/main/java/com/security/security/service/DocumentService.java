package com.security.security.service;

import com.security.security.model.Documents;
import com.security.security.repository.DocumentsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocumentService {
    @Autowired
    private DocumentsRepository docsRepo;

    public String saveDocuments(Documents docs) {
        Documents doc = (Documents) docsRepo.save(docs);
        return "Docs Uploaded Successfully";
    }
}
