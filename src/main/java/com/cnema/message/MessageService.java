package com.cnema.message;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cnema.util.FileSaver;

@Service
public class MessageService {

	@Inject
	private MessageDAO messageDAO;
	@Inject
	private FileSaver fileSaver;
	
	
	//메일 읽기
	public int mailRead(int message_num) throws Exception {
		return messageDAO.mailRead(message_num);
	}
	
	//메일 받기
	public List<MessageDTO> mailReceive(String id) throws Exception {
		return messageDAO.mailReceive(id);
	}
	
	//메일 보내기
	public int mailSend(String id, MessageDTO messageDTO) throws Exception {
		return messageDAO.mailSend(id, messageDTO);
	}
	
}
