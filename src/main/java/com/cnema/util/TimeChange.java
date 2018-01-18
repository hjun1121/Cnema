package com.cnema.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import com.cnema.movie.MovieDAO;
import com.cnema.movie.MovieDTO;

public class TimeChange {

	@Inject
	private MovieDAO movieDAO;
	
	public String getTimes(String day, String in_time, int movie_num,int count, int next){
		Calendar sDay = Calendar.getInstance();
		String out_time = null;
		String newIn_time=null;
		
		try {
			String all = day+in_time;
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-ddHH:mm");
			
			MovieDTO movieDTO = movieDAO.selectOne(movie_num);
			int run_time = movieDTO.getRun_time();
			next = next - run_time;
			
			Date d = sd.parse(all);
			sDay.setTime(d);
			
			
			for(int i =0; i<count; i++){
				int next2=0;
				if(i==0){
				}else{
					next2 = next;
				}
				SimpleDateFormat out = new SimpleDateFormat("HH:mm");
				sDay.add(Calendar.MINUTE, next2);
				Date d2 = sDay.getTime();
				newIn_time = out.format(d2);
				
				sDay.add(Calendar.MINUTE, run_time);
				out_time = out.format(d2);
				System.out.println(out_time);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return out_time;
	}
	
	public String getOutTime(String day, String in_time, int movie_num){
		Calendar sDay = Calendar.getInstance();
		String out_time = null;
		try {
			String all = day+in_time;
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-ddHH:mm");
			
			Date d = sd.parse(all);
			sDay.setTime(d);
			
			//System.out.println("시작시간"+sDay.getTime());
			MovieDTO movieDTO = movieDAO.selectOne(movie_num);
			int run_time = movieDTO.getRun_time();
			sDay.add(Calendar.MINUTE, run_time);
			//System.out.println("끝시간"+sDay.getTime());
			
			Date d2 = sDay.getTime();
			SimpleDateFormat out = new SimpleDateFormat("HH:mm");
			
			out_time = out.format(d2);
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return out_time;
	}
	
	public String getInTime(String day, String in_time, int next_time){
		Calendar sDay = Calendar.getInstance();
		try {
			String all = day+in_time;
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-ddHH:mm");
			
			Date d = sd.parse(all);
			sDay.setTime(d);
			
			sDay.add(Calendar.MINUTE, next_time);
			System.out.println("끝시간"+sDay.getTime());
			
			Date d2 = sDay.getTime();
			SimpleDateFormat out = new SimpleDateFormat("HH:mm");
			in_time = out.format(d2);
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return in_time;
	}	
}
