package com.cnema.theater;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="scheduleMapper.";
	
	public List<ScreenDTO> screenList(int theater_num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"screenList", theater_num);
	}
	
	public List<ScheduleDTO> scheduleList(int screen_num, Date day_num) throws Exception{
		Map<String, Object> map  =new HashMap<>();
		map.put("screen_num", screen_num);
		map.put("day_num", day_num);
		return sqlSession.selectList(NAMESPACE+"scheduleList", map);
	}
	
	public ScheduleDTO scheduleOne(int schedule_num)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"scheduleOne", schedule_num);
	}
	
	public ScreenDTO screenOne(int screen_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"screenOne", screen_num);
	}
	/*heeseong*/
	public ScheduleDTO scheduleInfo(int sNum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"scheduleInfo", sNum);
	}
	/*heeseong*/
	public List<ScheduleDTO> scheduleList() {
		return sqlSession.selectList(NAMESPACE+"scheduleList");
	}
}
