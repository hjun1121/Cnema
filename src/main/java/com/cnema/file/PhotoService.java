package com.cnema.file;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.cnema.util.FileSaver;

@Service
public class PhotoService {
	
	public String photoUpload(PhotoDTO photoDTO, HttpSession session){
		//service
		String filePath = session.getServletContext().getRealPath("resources/upload");
		//filePath=filePath+"resources/upload";
		File file = new File(filePath);
		System.out.println(filePath);
		if(!file.exists()){
			file.mkdirs();
		}
		FileSaver fs = new FileSaver();
		
		String fileName="";
		//String result="";
		StringBuffer stringBuffer = new StringBuffer();
		try {
			fileName=fs.fileSave(photoDTO.getFiledata(), session, "upload");
			//result="&bNewLine=true&sFileName="+photoDTO.getFiledata().getOriginalFilename()+"&sFileURL="+session.getServletContext().getContextPath()+File.separator+"upload"+File.separator+fileName;
			stringBuffer.append("&bNewLine=true&sFileName=");
			stringBuffer.append(photoDTO.getFiledata().getOriginalFilename());
			stringBuffer.append("&sFileURL=");
			stringBuffer.append(session.getServletContext().getContextPath());
			stringBuffer.append("/resources/");
			stringBuffer.append("upload");
			stringBuffer.append("/");
			stringBuffer.append(fileName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
		}
		
		System.out.println(photoDTO.getCallback()+photoDTO.getCallback_func()+stringBuffer.toString());
		return "redirect:"+photoDTO.getCallback()+photoDTO.getCallback_func()+stringBuffer.toString();
	}
}
