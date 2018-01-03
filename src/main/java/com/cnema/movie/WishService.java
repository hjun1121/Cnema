package com.cnema.movie;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class WishService {
	@Inject
	private WishDAO wishDAO;
	
	public List<WishDTO> wishList(String id) throws Exception{
		return wishDAO.wishList(id);
	}
}
