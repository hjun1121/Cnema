package com.cnema.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cnema.member.MemberDTO;

@Repository
public class MyCouponDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="myCouponMapper.";
	
	/*heeseong*/
	public List<MyCouponDTO> myCouponList(String id,String type) throws Exception{
		Map<String, Object> cMap = new HashMap<String, Object>();
		cMap.put("id", id);
		cMap.put("type", type);
		return sqlSession.selectList(NAMESPACE+"myCouponList",cMap);
	}
	/*heeseong*/
	public List<MyCouponDTO> myCouponDList(String id,String dp1,String dp2) throws Exception{
		Map<String, Object> cMap = new HashMap<String, Object>();
		cMap.put("id", id);
		cMap.put("dp1", dp1);
		cMap.put("dp2", dp2);
		return sqlSession.selectList(NAMESPACE+"myCouponDList",cMap);
	}
	/*heeseong*/
	public List<MyCouponDTO> myCouponAList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"myCouponAList",id);
	}
	
	/*heeseong*/
	public int dateUpdate(String id) throws Exception{
		return sqlSession.update(NAMESPACE+"dateUpdate",id);
	}
	public int couponInsert(MemberDTO memberDTO, CouponDTO couponDTO) throws Exception{
		Map<Object, Object> cMap = new HashMap<>();
		cMap.put("couponDTO", couponDTO);
		cMap.put("memberDTO", memberDTO);
		return sqlSession.insert(NAMESPACE+"dateUpdate",cMap);
	}
}
