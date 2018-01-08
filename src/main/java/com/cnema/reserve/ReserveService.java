package com.cnema.reserve;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ReserveService {
	@Inject
	private ReserveDAO reserveDAO;
	
	/*heeseong*/
	public List<ReserveDTO> reserveList(String id,String kind) throws Exception{
		return reserveDAO.reserveList(id,kind);
	}
	/*heeseong*/
	public List<ReserveDTO> reserveAList(String id) throws Exception{
		return reserveDAO.reserveAList(id);
	}
	/*heeseong*/
	public int reserveDel(int reserve_num) throws Exception{
		return reserveDAO.reserveDel(reserve_num);
	}
}
