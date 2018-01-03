package com.cnema.theater;

<<<<<<< HEAD
import java.util.List;

=======
>>>>>>> 105dd440f72d8446f95b7f275a2e47eed6c35c5e
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="scheduleMapper.";
	
	/*heeseong*/
<<<<<<< HEAD
	public ScheduleDTO scheduleInfo(int snum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"scheduleInfo", snum);
=======
	public ScheduleDTO scheduleInfo(int sNum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"scheduleInfo", sNum);
>>>>>>> 105dd440f72d8446f95b7f275a2e47eed6c35c5e
	}
}
