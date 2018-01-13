package com.cnema.coupon;


import javax.inject.Inject;
import org.springframework.stereotype.Service;


@Service
public class CoupongroupService {
	@Inject
	private CoupongroupDAO coupongroupDAO;
	
	public int groupInsert(String id) throws Exception{
		return coupongroupDAO.groupInsert(id);
	}
}
