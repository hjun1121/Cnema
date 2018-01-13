package com.cnema.coupon;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CoupongroupDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="coupongroupMapper.";
	
	public int groupInsert(String id) {
		return sqlSession.insert(NAMESPACE+"groupInsert",id);
	}
}
