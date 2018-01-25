package com.cnema.reserve;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReserveService {
	@Inject
	private ReserveDAO reserveDAO;
	
	
	public List<Integer> seatCheck(int screen_num, int schedule_num) throws Exception{
		return reserveDAO.seatCheck(screen_num,schedule_num);
	}
	
	public int reserveInsert(ReserveDTO reserveDTO) throws Exception{
		return reserveDAO.reserveInsert(reserveDTO);
	}
	/*heeseong*/
	public List<ReserveDTO> reserveList(String id,String kind) throws Exception{
		return reserveDAO.reserveList(id,kind);
	}
	/*heeseong*/
	public List<ReserveDTO> reserveAList(String id) throws Exception{
		return reserveDAO.reserveAList(id);
	}
	/*heeseong*/
	public ReserveDTO reserveBList(String id,int tp_num) throws Exception{
		return reserveDAO.reserveBList(id,tp_num);
	}
	/*heeseong*/
	public int reserveDel(int tp_num) throws Exception{
		return reserveDAO.reserveDel(tp_num);
	}
	/*heeseong*/
	public List<ReserveDTO> selectList(String id) throws Exception{
		return reserveDAO.selectList(id);
	}
}
