package com.cnema.board;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.event.EventDAO;
import com.cnema.notice.NoticeDAO;
import com.cnema.util.RowNum;

@Service
public class BoardTotalService {

	@Inject
	private EventDAO eventDAO;
	
	@Inject
	private NoticeDAO noticeDAO;
	
	public ModelAndView selectTotalList() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		RowNum rowNum= new RowNum();
		rowNum.setStartRow(1);
		rowNum.setLastRow(5);
		List<BoardDTO> ar2 = eventDAO.selectList(rowNum);
		
		List<BoardDTO> ar1 = noticeDAO.selectList(rowNum);
		mv.addObject("notice_list", ar1);
		mv.addObject("event_list", ar2);
		mv.setViewName("board/park");
		return mv;
	}

}
