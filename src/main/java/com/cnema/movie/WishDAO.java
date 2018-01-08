package com.cnema.movie;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class WishDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "wishMapper.";
	
	/*희성*/
	public List<WishDTO> wishList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"wishList",id);
	}

	public int wishListDelete(int wish_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"wishListDelete",wish_num);
	}
	
}
