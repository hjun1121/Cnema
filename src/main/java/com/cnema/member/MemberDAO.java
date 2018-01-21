package com.cnema.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="memberMapper.";
	
	/*kim*/
	public int pwUpdate(MemberDTO memberDTO){
		return sqlSession.update(NAMESPACE+"pwUpdate", memberDTO);
	}
	
	public int qrPointUpdate(int point, int getPoint, String id) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("point", point);
		map.put("getPoint", getPoint);
		map.put("id", id);
		return sqlSession.update(NAMESPACE+"qrPointUpdate", map);
	}
	
	public List<MemberDTO> idFind(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"idFind", memberDTO);
	}

	public int pwFind(MemberDTO memberDTO) throws Exception{
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
	/*heeseong*/
	public List<MemberDTO> memberSList(String kind) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberSList",kind);
	}
	/*heeseong*/
	public List<MemberDTO> memberCList(int ctype) throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberCList",ctype);
	}
	/*heeseong*/
	public int withdrawal(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"withdrawal",id);
	}
	/*heeseong*/
	public int myInfoRevision(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"myInfoRevision",memberDTO);
	}
	/*heeseong*/
	public int pointUpdate(int price, String id) throws Exception{
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("price", price);
		pMap.put("id", id);
		return sqlSession.update(NAMESPACE+"pointUpdate",pMap);
	}
}
