package com.cnema.movie;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class WishService {
	@Inject
	private WishDAO wishDAO;
	
	/*희성*/
	public List<WishDTO> wishList(String id,String kind) throws Exception{
		return wishDAO.wishList(id,kind);
	}
	/*희성*/
	public int wishListDelete(int wish_num) throws Exception{
		return wishDAO.wishListDelete(wish_num);
	}
}
