package com.cnema.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.board.BoardDTO;
import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;

@Service
public class NoticeService {
	@Inject
	private NoticeDAO noticeDAO;
	
	public List<NoticeDTO> noticeList()throws Exception{
		return noticeDAO.noticeList();
	}
	
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(noticeDAO.totalCount(rowNum));
	
		System.out.println(rowNum.getKind());
		System.out.println(rowNum.getSearch());
		
		List<BoardDTO> ar = noticeDAO.selectList(rowNum);
		mv.addObject("pager", pager);
		mv.addObject("list", ar);
		mv.setViewName("notice/noticeList");
		return mv;
	}
	
	public BoardDTO selectOne(int num) throws Exception {
		noticeDAO.hitUpdate(num);
		BoardDTO boardDTO = noticeDAO.selectOne(num);
		//((NoticeDTO)boardDTO).setFileNames(fileDAO.selectList(num));
		
		return boardDTO;
	}
	public int insert(BoardDTO boardDTO, HttpSession session) throws Exception {
		int result = noticeDAO.insert(boardDTO);
		return result;
	}


	public int update(BoardDTO boardDTO) throws Exception {
		int result = noticeDAO.update(boardDTO);
		return result;
	}

	
	public int delete(int num) throws Exception {
		int result = noticeDAO.delete(num);
		return result;
	}
}
