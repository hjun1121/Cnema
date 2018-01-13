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
	
	public List<Integer> movieNumList(int theater_num, String day) throws Exception{
		Map<String, Object> map = new HashMap<>();
		System.out.println(day);
		map.put("day", day);
		map.put("theater_num", theater_num);
		return sqlSession.selectList(NAMESPACE+"movieNumList", map);
	}
	
	public List<ScreenDTO> screenList(int theater_num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"screenList", theater_num);
	}
	
	public List<ScheduleDTO> scheduleList(int screen_num, Date day_num, int movie_num) throws Exception{
		Map<String, Object> map  =new HashMap<>();
		map.put("screen_num", screen_num);
		map.put("day_num", day_num);
		map.put("movie_num", movie_num);
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
	public List<ScheduleDTO> scheduleAList() {
		return sqlSession.selectList(NAMESPACE+"scheduleAList");
	}
	/*heeseong*/
	public int scheduleRevision(ScheduleDTO scheduleDTO) {
		return sqlSession.update(NAMESPACE+"scheduleRevision",scheduleDTO);
	}
	/*heeseong*/
	public int scheduleRemove(int schedule_num) {
		return sqlSession.delete(NAMESPACE+"scheduleRemove",schedule_num);
	}
	/*heeseong*/
	public int scheduleInsert(ScheduleDTO scheduleDTO) {
		return sqlSession.insert(NAMESPACE+"scheduleInsert",scheduleDTO);
	}
}
