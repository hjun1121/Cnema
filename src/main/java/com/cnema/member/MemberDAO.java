package com.cnema.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="memberMapper.";
	
	public MemberDTO selectOne(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", id);
	}
}
