package com.cnema.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class PointService {
	@Inject
	private PointDAO pointDAO;
	
	public List<PointDTO> pointList(String id,String testDatepicker) throws Exception{
		return pointDAO.pointList(id,testDatepicker);
	}
}
