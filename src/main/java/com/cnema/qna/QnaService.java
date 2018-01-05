package com.cnema.qna;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.qna.QnaDAO;
import com.cnema.board.BoardDTO;
import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;

@Service
public class QnaService {

	@Inject
	private QnaDAO qnaDAO;
	
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(qnaDAO.totalCount(rowNum));
		List<BoardDTO> ar = qnaDAO.selectList(rowNum);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("qna/qnaList");
		return mv;
	}
	
	public BoardDTO selectOne(int num) throws Exception {
		qnaDAO.hitUpdate(num);
		BoardDTO boardDTO = qnaDAO.selectOne(num);
		return boardDTO;
	}
	
	public int insert(BoardDTO boardDTO, HttpSession session) throws Exception {
		int result = qnaDAO.insert(boardDTO);
		return result;
	}
	
	public int delete(int num) throws Exception {
		int result = qnaDAO.delete(num);
		return result;
	}
	
}
