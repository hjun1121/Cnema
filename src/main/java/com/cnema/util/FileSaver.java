package com.cnema.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	
	public String fileSave(MultipartFile multipartFile, HttpSession session, String path) throws Exception{
		//1. realPath
		String filePath = session.getServletContext().getRealPath("resources/"+path);
		System.out.println(filePath);
		File file = new File(filePath);
		if(!file.exists()){
			file.mkdirs();
		}
		
		//2. fileName
		String fileName = multipartFile.getOriginalFilename();
		fileName = fileName.substring(fileName.lastIndexOf("."));
		fileName = UUID.randomUUID().toString()+fileName;
		
		file = new File(filePath, fileName);
		
		multipartFile.transferTo(file);
		
		return fileName;
	}
	
}
