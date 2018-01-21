package com.cnema.theater;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sun.glass.ui.Screen;

@Repository
public class ScheduleDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="scheduleMapper.";
	
	public List<Integer> screenNumList(int theater_num, String day, int movie_num) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("day", day);
		map.put("theater_num", theater_num);
		map.put("movie_num", movie_num);
		return sqlSession.selectList(NAMESPACE+"screenNumList", map);
	}
	
	public List<Integer> movieNumList(int theater_num, String day) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("day", day);
		map.put("theater_num", theater_num);
		return sqlSession.selectList(NAMESPACE+"movieNumList", map);
	}
	
	public List<ScreenDTO> screenList(int theater_num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"screenList", theater_num);
	}
	
	public List<ScheduleDTO> movieSchedule(int theater_num, String day , int movie_num, int screen_num) throws Exception{
		Map<String, Object> map  =new HashMap<>();
		map.put("theater_num", theater_num);
		map.put("day", day);
		map.put("movie_num", movie_num);
		map.put("screen_num", screen_num);
		return sqlSession.selectList(NAMESPACE+"movieSchedule", map);
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
	public int screenInsert(ScreenDTO screenDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"screenInsert",screenDTO);
	}
	
	/*heeseong*/
	public ScheduleDTO scheduleInfo(int sNum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"scheduleInfo", sNum);
	}
	/*heeseong*/
	public List<ScheduleDTO> scheduleAList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"scheduleAList");
	}
	/*heeseong*/
	public int scheduleRevision(ScheduleDTO scheduleDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"scheduleRevision",scheduleDTO);
	}
	/*heeseong*/
	public int scheduleRemove(int schedule_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"scheduleRemove",schedule_num);
	}
	/*heeseong*/
	public int scheduleInsert(ScheduleDTO scheduleDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"scheduleInsert",scheduleDTO);
	}
	/*heeseong*/
	public List<ScreenDTO> screenAList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"screenAList");
	}
	/*heeseong*/
	public int screenRevision(ScreenDTO screenDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"screenRevision",screenDTO);
	}
	/*heeseong*/
	public int screenRemove(int screen_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"screenRemove",screen_num);
	}
	/*heeseong*/
	public ScreenDTO screenInfo(int theater_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"screenInfo", theater_num);
	}
}
