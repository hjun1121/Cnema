package com.cnema.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.util.RowNum;

@Repository
public class WishDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "wishMapper.";
	
	/*heeseong*/
	public int wTotalCount(String id,String kind) throws Exception{
		Map<String, Object> wMap = new HashMap<>();
		wMap.put("id", id);
		wMap.put("kind", kind);
		return sqlSession.selectOne(NAMESPACE+"wTotalCount",wMap);
	}
	/*희성*/
	public List<WishDTO> wishList(String id,String kind,RowNum rowNum) throws Exception{
		Map<String, Object> wMap = new HashMap<>();
		wMap.put("id", id);
		wMap.put("kind", kind);
		wMap.put("rowNum", rowNum);
		return sqlSession.selectList(NAMESPACE+"wishList",wMap);
	}
	/*희성*/
	public int wishListDelete(int wish_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"wishListDelete",wish_num);
	}
}
