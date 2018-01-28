package com.cnema.theater;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class DayDAO {
	
	public String week(String day){
		day = "2018-01-27";
		Calendar sDay = Calendar.getInstance();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sd2 = new SimpleDateFormat("E");
		String week = null;
		try {
			java.util.Date d = sd.parse(day);
			sDay.setTime(d);
			week = sd2.format(d);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return week;
	}
	
	public List<DayDTO> dayList(){
		Calendar sDay = Calendar.getInstance();
		
		int year = sDay.get(Calendar.YEAR);
		int month = sDay.get(Calendar.MONTH)+1;
		int date = sDay.get(Calendar.DATE);
		sDay.set(year, month-1, date);
		
		int lastDay = sDay.getActualMaximum(Calendar.DAY_OF_MONTH);

		int maxDay= date+14;
		int count = 0;
		
		SimpleDateFormat sd = new SimpleDateFormat("E");
		
		List<DayDTO> ar = new ArrayList<>();
		
		for(int i = date; i <= maxDay; i++){
			DayDTO dayDTO = new DayDTO();
			sDay.set(year, month-1, i);
			Date DTO = new Date(sDay.getTimeInMillis());
			dayDTO.setDay_num(DTO);
			dayDTO.setDay(sDay.get(Calendar.DATE));
			dayDTO.setWeek(sd.format(sDay.getTime()));
			dayDTO.setMonth(sDay.get(Calendar.MONTH)+1);
			ar.add(dayDTO);
			
			if(i>lastDay){
				month= month+1;
				i=1;
				maxDay = i+14-count;
			}
			count++;
		}
		return ar;
		
	}
}
