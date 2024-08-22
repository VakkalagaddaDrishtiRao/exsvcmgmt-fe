package com.security.security.config;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Base64;

public class FileUtil {
    public static String encodeFileToBase64Binary(File file) throws IOException {
        byte[] fileContent = new byte[(int) file.length()];
        try (FileInputStream fileInputStream = new FileInputStream(file)) {
            fileInputStream.read(fileContent);
        }
        return Base64.getEncoder().encodeToString(fileContent);
    }
}

