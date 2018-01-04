package com.cnema.theater;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="scheduleMapper.";
	
	/*heeseong*/
	public ScheduleDTO scheduleInfo(int sNum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"scheduleInfo", sNum);
	}
}
