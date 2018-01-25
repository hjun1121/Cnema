package com.cnema.reserve;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TicketPriceService {
	@Inject
	private TicketPriceDAO ticketPriceDAO;
	
	public int nextval() throws Exception{
		return ticketPriceDAO.nextval();
	}
	
	public int tpInsert(TicketPriceDTO ticketPriceDTO) throws Exception{
		return ticketPriceDAO.tpInsert(ticketPriceDTO);
	}
	
	/*heeseong*/
	public TicketPriceDTO ticketPInfo(int tp_num) throws Exception{
		return ticketPriceDAO.ticketPInfo(tp_num);
	}
	/*heeseong*/
	public int ticketRemove(int tp_num) throws Exception{
		return ticketPriceDAO.ticketRemove(tp_num);
	}
}
