package com.cnema.util;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cnema.member.MemberDAO;
import com.cnema.member.MemberDTO;

public class EmailDAO {

	public int qnaReplySend(String email) {
		int result=0;
		String host     = "smtp.naver.com";
		  final String user   = "library_4";
		  final String password  = "gudwns93";
		  String to     = email;
		  // Get the session object
		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");
		  
		  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(user, password);
		   }
		  });

		  // Compose the message
		  try {
		   MimeMessage message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(user));
		   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

		   // Subject
		   message.setSubject("[Cnema]답글이 달렸습니다.");
		   
		   
		   String mes = "답글내용";
		   message.setText(mes); //보내는 내용

		   // send the message
		   Transport.send(message);
		   System.out.println("message sent successfully...");
		   result=1;

		  } catch (MessagingException e) {
		   e.printStackTrace();
		   result=0;
		  }
		  return result;
	}
	
	
	public int send(HttpSession session2 ,String email) {
		int result=0;
		String host     = "smtp.naver.com";
		  final String user   = "library_4";
		  final String password  = "gudwns93";
		  String to     = email;
		  // Get the session object
		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");
		  
		  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(user, password);
		   }
		  });

		  // Compose the message
		  try {
		   MimeMessage message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(user));
		   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

		   // Subject
		   message.setSubject("Cnema 회원 인증 메일");
		   
		   // Textc 
		   Random r = new Random();
		   String str = String.valueOf(r.nextInt(9));
		   str = str + String.valueOf(r.nextInt(9));
		   str = str + String.valueOf(r.nextInt(9));
		   str = str + String.valueOf(r.nextInt(9));
		   str = str + String.valueOf(r.nextInt(9));
		   str = str + String.valueOf(r.nextInt(9));
		   
		   String mes = "인증번호 :"+str;
		   session2.setAttribute("check", str);
		   message.setText(mes); //보내는 내용

		   // send the message
		   Transport.send(message);
		   System.out.println("message sent successfully...");
		   result=1;

		  } catch (MessagingException e) {
		   e.printStackTrace();
		   result=0;
		  }
		  return result;
	}
	
	public int sendPw(HttpServletRequest request, MemberDTO memberDTO) {
		int result=0;
		String host     = "smtp.naver.com";
		  final String user   = "library_4";
		  final String password  = "gudwns93";
		  String to     = memberDTO.getEmail();
		  // Get the session object
		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");
		  
		  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(user, password);
		   }
		  });

		  // Compose the message
		  try {
		   MimeMessage message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(user));
		   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

		   // Subject
		   message.setSubject("FnW 비밀번호 찾기");
		   
		   // Textc 
		   Random r = new Random();
			 String p = "a1b2c3d4e5f6g7h8i9j";
			 String str = String.valueOf(p.charAt(r.nextInt(19)));
			 str = str + String.valueOf(p.charAt(r.nextInt(19)));
			 str = str + String.valueOf(p.charAt(r.nextInt(19)));
			 str = str + String.valueOf(p.charAt(r.nextInt(19)));
			 str = str + String.valueOf(p.charAt(r.nextInt(19)));
			 str = str + String.valueOf(p.charAt(r.nextInt(19)));
			 str = str + String.valueOf(p.charAt(r.nextInt(19)));
			 str = str + String.valueOf(p.charAt(r.nextInt(19)));
			 
			 String mes = "임시비밀번호 :"+str +"\n로그인 후 꼭 pw 를 바꿔주세요";
		   message.setText(mes); //보내는 내용
		   
		   // send the message
		   Transport.send(message);
		   System.out.println("message sent successfully...");
		   
		   result=1;
		   MemberDAO memberDAO = new MemberDAO();
		   try {
			   
		   } catch (Exception e) {
			e.printStackTrace();
			 result=0;
		   }
		   
		   
		  } catch (MessagingException e) {
		   e.printStackTrace();
		   result=0;
		  }
		  return result;
	}

}
