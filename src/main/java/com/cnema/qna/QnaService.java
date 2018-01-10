package com.cnema.qna;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.qna.QnaDAO;
import com.cnema.board.BoardDTO;
import com.cnema.util.FileSaver;
import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;

@Service
public class QnaService {

	@Inject
	private QnaDAO qnaDAO;
	@Inject
	private FileSaver fileSaver;
	
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

	//member 자신의 Qna List만 보여주는 것
	public ModelAndView selectMyList(String id) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = qnaDAO.selectMyList(id);
		mv.addObject("list", ar);
		mv.setViewName("qna/qnaList");
		return mv;
	}
	
	public QnaDTO selectOne(int num) throws Exception {
		QnaDTO boardDTO = qnaDAO.selectOne(num);
		return boardDTO;
	}
	
	public int insert(QnaDTO qnaDTO, HttpSession session) throws Exception {
		
	
		MultipartFile file = qnaDTO.getFile();
		String name = fileSaver.fileSave(file, session, "board");
		
		qnaDTO.setFileName(name);
		qnaDTO.setOriName(file.getOriginalFilename());
		int result = qnaDAO.insert(qnaDTO);

		return result;
	}
	
	public int delete(int num) throws Exception {
		int result = qnaDAO.delete(num);
		return result;
	}
	
	/*******************Qna 답글 부분 **************/
	public int update(QnaDTO boardDTO) throws Exception {
		int result = qnaDAO.update(boardDTO);
		return result;
	}
	
}