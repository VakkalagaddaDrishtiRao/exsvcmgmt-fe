package com.security.security.controller;
import com.security.security.config.FileUtil;
import com.security.security.model.Documents;
import com.security.security.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@RestController
public class DocsUploadController {

    @Autowired
    private DocumentService documentsService;

    @PostMapping("/secure/uploadDocs")
    public ResponseEntity<String> uploadDocument(@RequestParam("file") MultipartFile file, @RequestParam("docType") String docType) {
        try {
            // Convert the MultipartFile to a File object
            File convFile = new File(file.getOriginalFilename());
            file.transferTo(convFile);

            // Convert the file to Base64
            String base64File = FileUtil.encodeFileToBase64Binary(convFile);

            // Create a Documents object and set the appropriate field
            Documents documents = new Documents();
            switch (docType.toLowerCase()) {
                case "dischargebook":
                    documents.setDischargeBook(base64File.getBytes());
                    break;
                case "ppo":
                    documents.setPPO(base64File.getBytes());
                    break;
                case "passportphoto":
                    documents.setPassportPhoto(base64File.getBytes());
                    break;
                case "pan":
                    documents.setPAN(base64File.getBytes());
                    break;
                case "epic":
                    documents.setEPIC(base64File.getBytes());
                    break;
                case "adhaar":
                    documents.setAdhaar(base64File.getBytes());
                    break;
                default:
                    return new ResponseEntity<>("Invalid document type", HttpStatus.BAD_REQUEST);
            }

            // Save the document
            documentsService.saveDocuments(documents);
            return new ResponseEntity<>("Document uploaded successfully", HttpStatus.CREATED);

        } catch (IOException e) {
            return new ResponseEntity<>("Failed to upload document", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
