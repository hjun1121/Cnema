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
	@Inject
	private EventJoinDAO eventJoinDAO;
	
	//이벤트 신청 당첨 유무
	public int eventJoin(EventJoinDTO eventJoinDTO) throws Exception {
		
		int result=eventJoinDAO.insert(eventJoinDTO);
		
		return result;
	}
	//이벤트 데이터 조회
	public int eventJoinCheck(EventJoinDTO eventJoinDTO) throws Exception{
		int check= eventJoinDAO.selectOne(eventJoinDTO);
		
		return check;
	}
	
	//기본 진행중인 이벤트 리스트 
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
	//이벤트 home에 뿌리는것 
	public List<BoardDTO> selectList() throws Exception {

		RowNum rowNum= new RowNum();
		rowNum.setStartRow(1);
		rowNum.setLastRow(4);
		List<BoardDTO> ar = eventDAO.selectList(rowNum);
		
		return ar;
	}
	
	//종류된 이벤트 리스트
	public ModelAndView endSelectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(eventDAO.endTotalCount(rowNum));
	
		
		List<EventDTO> ar = eventDAO.endSelectList(rowNum);
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.setViewName("ajax/endList");
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
		int result=0;
		if(eventDTO.getFile().getOriginalFilename()==""){
			
		result = eventDAO.update(eventDTO);
	
		}else{
			
		MultipartFile file = eventDTO.getFile();
		String name = fileSaver.fileSave(file, session, "board");
		eventDTO.setFileName(name);
		eventDTO.setOriName(file.getOriginalFilename());
		
		result = eventDAO.update(eventDTO);
		}
		return result;
	}
	
	public int delete(int num) throws Exception {
		int result = eventDAO.delete(num);
		return result;
	}
}
