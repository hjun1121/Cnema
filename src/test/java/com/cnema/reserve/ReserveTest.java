package com.cnema.reserve;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.cnema.c1.AbstractTest;
import com.cnema.theater.ScheduleDAO;
import com.cnema.theater.ScheduleDTO;
import com.cnema.theater.ScreenDTO;

import oracle.net.aso.d;

public class ReserveTest extends AbstractTest {

	@Inject
	private ReserveDAO reserveDAO;
	@Inject
	private ScheduleDAO scheduleDAO;
	public void num(){
		int startNum = 65;
		
		int lastNum = startNum+5-1;
		int xRow = lastNum-startNum+1;
		int yRow = 5;
		for(int i = startNum; i<=lastNum; i++){
			for(int j=1; j<=yRow; j++){
				System.out.println((char)i+"열"+j);
			}
		}

		/*int num = 65;
		char ch = (char)num;
		System.out.println("숫자 :"+num);
		System.out.println("문자 :"+ch);
		
		char ch2 = 'B';
		int num2 = ch2;
		System.out.println("문자 :"+ch2);		
		System.out.println("숫자 :"+num2);*/
	}
	
	public void list(){
		List<ScreenDTO> ar;
		List<ScheduleDTO> ar2;
		Calendar sDay = Calendar.getInstance();
		Date DTO = new Date(sDay.getTimeInMillis());
		try {
			
			ar = scheduleDAO.screenList(1);
			for(ScreenDTO screenDTO : ar){
				
				System.out.println(screenDTO.getScreen_num());
				//ar2  =scheduleDAO.scheduleList(screenDTO.getScreen_num(),DTO);
				//screenDTO.setAr(ar2);
				
/*				for(ScheduleDTO scheduleDTO : ar2){
					System.out.println(scheduleDTO.getIn_time());
				}*/
				
				List<ScheduleDTO> aa = screenDTO.getAr();
				for(ScheduleDTO scheduleDTO : aa){
					System.out.println(scheduleDTO.getIn_time());
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void time(){
		Calendar sDay = Calendar.getInstance();
		try {
			
			ScheduleDTO scheduleDTO = scheduleDAO.scheduleInfo(1);
			System.out.println("in :"+scheduleDTO.getIn_time());
			String in = scheduleDTO.getIn_time();
			
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			java.util.Date d = sd.parse(in);
			sDay.setTime(d);
			System.out.println(sDay.getTimeInMillis());
			System.out.println(sDay.getTime());
			
			SimpleDateFormat sd2 = new SimpleDateFormat("HH:mm");
			String str = sd2.format(d);
			System.out.println(str);
			//long s = 130*60*1000;
			//sDay.setTimeInMillis(sDay.getTimeInMillis()+s);
			
			sDay.add(Calendar.MINUTE, 130);
			
			System.out.println(sDay.getTime());
			int ss = 130*60;
			DateFormat df = DateFormat.getDateInstance();
			int m = 130;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void getOutTime(){
		Calendar sDay = Calendar.getInstance();
		try {
			int count = 3;
			int next = 180;
			String day = "2018-01-19";
			String in_time ="13:00";
			String all = day+in_time;
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-ddHH:mm");
			
			java.util.Date d = sd.parse(all);
			sDay.setTime(d);
			
			System.out.println("시작시간"+sDay.getTime());
			sDay.add(Calendar.MINUTE, 130);
			System.out.println("끝시작"+sDay.getTime());
			
			java.util.Date d2 = sDay.getTime();
			SimpleDateFormat out = new SimpleDateFormat("HH:mm");
			
			String out_time = out.format(d2);
			System.out.println(out_time);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void test() {
		Calendar sDay = Calendar.getInstance();
		try {
			int count = 3;
			int next = 180-130;
			String day = "2018-01-19";
			String in_time ="13:00";
			String all = day+in_time;
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-ddHH:mm");
			
			java.util.Date d = sd.parse(all);
			sDay.setTime(d);
			
			for(int i =0; i<count; i++){
				int next2=0;
				if(i==0){
				}else{
					next2 = next;
				}
				SimpleDateFormat out = new SimpleDateFormat("HH:mm");
				
				sDay.add(Calendar.MINUTE, next2);
				
				java.util.Date d2 = sDay.getTime();
				System.out.println("시작시간"+sDay.getTime());
				
				String New_in_time = out.format(d2);
				
				sDay.add(Calendar.MINUTE, 130);
				System.out.println("끝시작"+sDay.getTime());
				
				d2 = sDay.getTime();
				String out_time = out.format(d2);
				System.out.println("in"+New_in_time);
				System.out.println("out"+out_time);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}










