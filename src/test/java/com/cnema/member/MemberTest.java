package com.cnema.member;

import static org.junit.Assert.*;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.junit.Test;

import com.cnema.c1.AbstractTest;
import com.cnema.reserve.TicketPriceDAO;
import com.cnema.reserve.TicketPriceDTO;
import com.cnema.theater.DayDTO;
import com.cnema.theater.TheaterDAO;
import com.cnema.theater.TheaterDTO;
import com.cnema.util.EmailDAO;

public class MemberTest extends AbstractTest {

	@Inject
	private MemberDAO memberDAO;
	@Inject
	private EmailDAO emailDAO;
	@Inject
	private TheaterDAO theaterDAO;
	@Inject
	private TicketPriceDAO ticketPriceDAO;
	

	
	@Test
	public void test() {
		
		try {
			Calendar sDay = Calendar.getInstance();
			
			int year = sDay.get(Calendar.YEAR);
			int month = sDay.get(Calendar.MONTH)+1;
			int date = sDay.get(Calendar.DATE);
			date = 20;
			sDay.set(year, month-1, date);
			
			int lastDay = sDay.getActualMaximum(Calendar.DAY_OF_MONTH);

			int maxDay= date+14;
			int count = 0;
			
			List<DayDTO> ar = new ArrayList();
			for(int i = date; i <= maxDay; i++){
				DayDTO dayDTO = new DayDTO();
				sDay.set(year, month-1, i);
				Date DTO = new Date(sDay.getTimeInMillis());
				dayDTO.setDay_num(DTO);
				ar.add(dayDTO);
				
				if(i>lastDay){
					month= month+1;
					i=1;
					maxDay = i+14-count;
				}
				System.out.println(year+"년"+month+"월"+i);
				
				count++;
			}
			
			for(DayDTO dayDTO : ar){
				System.out.println(dayDTO.getDay_num());
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
