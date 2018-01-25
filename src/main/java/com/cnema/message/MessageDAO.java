package com.cnema.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "messageMapper.";
	

	//메일 읽기
	public int mailRead(int message_num) throws Exception {
		return sqlSession.update(NAMESPACE+"mailRead", message_num);
	}
	
	//메일 받기
	public List<MessageDTO> mailReceive(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+"mailReceive", id);
	}
	
	//메일 보내기
	public int mailSend(String id, MessageDTO messageDTO) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("send_id", id);
		map.put("messageDTO", messageDTO);
		return sqlSession.insert(NAMESPACE+"mailSend", map);
	}
	
}
