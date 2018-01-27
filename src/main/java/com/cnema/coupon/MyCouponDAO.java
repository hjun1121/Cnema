package com.cnema.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.member.MemberDTO;
import com.cnema.util.RowNum;

@Repository
public class MyCouponDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="myCouponMapper.";
	
	public List<MyCouponDTO> myCouponList(String id)throws Exception{
		return sqlSession.selectList(NAMESPACE+"myCouponList", id);
	}
	
	public int qrCouponUpdate(int c_num, String id) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("c_num", c_num);
		map.put("id", id);
		return sqlSession.update(NAMESPACE+"qrCouponUpdate", map);
	}
	/*heeseong*/
	public int hTotalCount(String id,String type) throws Exception{
		Map<String, Object> chMap = new HashMap<>();
		chMap.put("id", id);
		chMap.put("type", type);
		return sqlSession.selectOne(NAMESPACE+"hTotalCount",chMap);
	}
	
	/*heeseong*/
	public List<MyCouponDTO> myCouponHistoryList(String id,String type,RowNum rowNum) throws Exception{
		Map<String, Object> cMap = new HashMap<String, Object>();
		cMap.put("id", id);
		cMap.put("type", type);
		cMap.put("rowNum", rowNum);
		return sqlSession.selectList(NAMESPACE+"myCouponHistoryList",cMap);
		/*Map<String, Object> cMap = new HashMap<String, Object>();
		cMap.put("id", id);
		cMap.put("type", type);
		return sqlSession.selectList(NAMESPACE+"myCouponHistoryList",cMap);*/
	}
	/*heeseong*/
	public int dTotalCount(String id,String dp1,String dp2) throws Exception{
		Map<String, Object> cMap = new HashMap<String, Object>();
		cMap.put("id", id);
		cMap.put("dp1", dp1);
		cMap.put("dp2", dp2);
		return sqlSession.selectOne(NAMESPACE+"dTotalCount",cMap);
	}
	/*heeseong*/
	public List<MyCouponDTO> myCouponDList(String id,String dp1,String dp2,RowNum rowNum) throws Exception{
		Map<String, Object> cMap = new HashMap<String, Object>();
		cMap.put("id", id);
		cMap.put("dp1", dp1);
		cMap.put("dp2", dp2);
		cMap.put("rowNum", rowNum);
		return sqlSession.selectList(NAMESPACE+"myCouponDList",cMap);
		/*Map<String, Object> cMap = new HashMap<String, Object>();
		cMap.put("id", id);
		cMap.put("dp1", dp1);
		cMap.put("dp2", dp2);
		return sqlSession.selectList(NAMESPACE+"myCouponDList",cMap);*/
	}
	/*heeseong*/
	public List<MyCouponDTO> myCouponAList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"myCouponAList",id);
	}
	
	/*heeseong*/
	public int dateUpdate(String id) throws Exception{
		return sqlSession.update(NAMESPACE+"dateUpdate",id);
	}
	/*heeseong*/
	public int couponInsert(String id, CouponDTO couponDTO,String v_date) throws Exception{
		Map<Object, Object> cMap = new HashMap<>();
		cMap.put("couponDTO", couponDTO);
		cMap.put("id", id);
		cMap.put("v_date", v_date);
		return sqlSession.insert(NAMESPACE+"couponInsert",cMap);
	}
	/*heeseong*/
	public int couponCount(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"couponCount",id);
	}
	/*heeseong*/
	public int couponACount(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"couponACount",id);
	}
	/*heeseong*/
	public int withdrawal(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"withdrawal",id);
	}
}
