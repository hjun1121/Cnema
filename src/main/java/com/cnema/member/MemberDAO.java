package com.cnema.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="memberMapper.";
	
	/*kim*/
	public List<MemberDTO> idFind(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"idFind", memberDTO);
	}

	public MemberDTO pwFind(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"pwFind", memberDTO);
	}
	
	public int join(MemberDTO memberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"join", memberDTO);
	}
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"login", memberDTO);
	}
	
	/*heeseong*/
	public MemberDTO memberInfo(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberInfo", id);
	}
	/*heeseong*/
	public List<MemberDTO> memberList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberList");
	}
	
}
