package com.cnema.qna;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.qna.QnaDAO;
import com.cnema.theater.TheaterDTO;
import com.cnema.board.BoardDTO;
import com.cnema.util.EmailDAO;
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
	@Inject
	private EmailDAO emailDAO;
	
	
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(qnaDAO.totalCount(rowNum));
		List<BoardDTO> ar = qnaDAO.selectList(rowNum);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("admin/myQnaList");
		return mv;
	}
	
	public List<BoardDTO> selectListMypage() throws Exception {
		RowNum rowNum= new RowNum();
		rowNum.setStartRow(1);
		rowNum.setLastRow(5);
		List<BoardDTO> ar = qnaDAO.selectList(rowNum);
		return ar;
	}

	//member 자신의 Qna List만 보여주는 것
	public ModelAndView selectMyList(String id) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = qnaDAO.selectMyList(id);
		mv.addObject("list", ar);
		mv.setViewName("admin/myQnaList");
		return mv;
	}
	
	public List<BoardDTO> selectIdList(String id)throws Exception{
		List<BoardDTO> ar = qnaDAO.selectMyList(id);
		
		return ar;
	}
	
	public QnaDTO selectOne(int num) throws Exception {
		QnaDTO boardDTO = qnaDAO.selectOne(num);
		return boardDTO;
	}
	
	public int insert(QnaDTO qnaDTO, HttpSession session) throws Exception {
		
		int result=0;
		if(qnaDTO.getFile().getOriginalFilename()==""){
			
			qnaDTO.setFileName("noFile");
			qnaDTO.setOriName("noFile");
			result=qnaDAO.insert(qnaDTO);
		}
		else{
		MultipartFile file = qnaDTO.getFile();
		String name = fileSaver.fileSave(file, session, "board");
		
		qnaDTO.setFileName(name);
		qnaDTO.setOriName(file.getOriginalFilename());
		result = qnaDAO.insert(qnaDTO);
		}
		return result;
	}
	
	public int delete(int num) throws Exception {
		int result = qnaDAO.delete(num);
		return result;
	}
	
	/*******************Qna 답글 부분 **************/
	public int update(QnaDTO boardDTO) throws Exception {
		int result = qnaDAO.update(boardDTO);
		if(result>0){
			emailDAO.qnaReplySend(boardDTO);
		}
		return result;
	}

	/*heeseong*/
	public int qTotalCount(String id,String kind,String search) throws Exception{
		return qnaDAO.qTotalCount(id,kind, search);
	}
	/*heeseong*/
	public ModelAndView myQnaList(String id,String kind,String search,ListData listData) throws Exception {
		/*return qnaDAO.myQnaList(id,kind,search);*/
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(qnaDAO.qTotalCount(id,kind,search));
		
		List<QnaDTO> qnaList = qnaDAO.myQnaList(id,kind, search, rowNum);
		mv.addObject("qnaList", qnaList);
		mv.addObject("pager",pager);
		return mv;
	}
	
}
