package com.cnema.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownload extends AbstractView {
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		File file = (File)model.get("down");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentLength((int)file.length()); //파일의 크기
		String fileName = (String)model.get("oriname");
		//파일명을 UTF-8로 인코딩
		fileName = URLEncoder.encode(fileName, "UTF-8");
		
		response.setHeader("Content-Disposition", "attatchment;filename=\""+fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		FileInputStream fi = null;
		
		fi = new FileInputStream(file);
		
		FileCopyUtils.copy(fi, out);
		
		fi.close();
		out.close();
		
		
	}
	
}
