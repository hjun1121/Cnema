package com.cnema.reserve;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TicketPriceService {
	@Inject
	private TicketPriceDAO ticketPriceDAO;
	
	/*heeseong*/
	public TicketPriceDTO ticketPInfo(int tp_num) throws Exception{
		return ticketPriceDAO.ticketPInfo(tp_num);
	}
}
