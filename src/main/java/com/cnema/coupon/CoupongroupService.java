package com.cnema.coupon;


import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;


/*heesoeng 코드*/
@Service
public class CoupongroupService {
	@Inject
	private CoupongroupDAO coupongroupDAO;
	
	public int groupInsert(String id,int number) throws Exception{
		return coupongroupDAO.groupInsert(id,number);
	}

	public List<CoupongroupDTO> groupList() throws Exception{
		return coupongroupDAO.groupList();
	}

	public List<CoupongroupDTO> groupSList(int group_num) throws Exception{
		return coupongroupDAO.groupSList(group_num);
	}

	public int groupRemove(int group_num) throws Exception{
		return coupongroupDAO.groupRemove(group_num);
	}

	public int withdrawal(String id) throws Exception{
		return coupongroupDAO.withdrawal(id);
	}
}
