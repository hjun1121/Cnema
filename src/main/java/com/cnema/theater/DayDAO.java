package com.cnema.theater;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class DayDAO {
	
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
