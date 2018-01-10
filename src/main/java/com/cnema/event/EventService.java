package com.cnema.event;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.board.BoardDTO;
import com.cnema.util.FileSaver;
import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;

@Service
public class EventService {

	@Inject
	private EventDAO eventDAO;
	@Inject
	private FileSaver fileSaver;
	
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(eventDAO.totalCount(rowNum));
	
		
		List<BoardDTO> ar = eventDAO.selectList(rowNum);
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.setViewName("event/eventList");
		return mv;
	}
	
	public BoardDTO selectOne(int num) throws Exception {
		//eventDAO.hitUpdate(num);
		BoardDTO boardDTO = eventDAO.selectOne(num);
		//((eventDAODTO)boardDTO).setFileNames(fileDAO.selectList(num));
		
		return boardDTO;
	}
	
	public int insert(EventDTO eventDTO, HttpSession session) throws Exception {
		
		MultipartFile file = eventDTO.getFile();
		String name = fileSaver.fileSave(file, session, "board");
		
		eventDTO.setFileName(name);
		eventDTO.setOriName(file.getOriginalFilename());
		
		
		int result = eventDAO.insert(eventDTO);
		return result;
	}


	public int update(EventDTO eventDTO, HttpSession session) throws Exception {
		MultipartFile file = eventDTO.getFile();
		String name = fileSaver.fileSave(file, session, "board");
		
		eventDTO.setFileName(name);
		eventDTO.setOriName(file.getOriginalFilename());
		
		int result = eventDAO.update(eventDTO);
		return result;
	}
	
	public int delete(int num) throws Exception {
		int result = eventDAO.delete(num);
		return result;
	}
}
