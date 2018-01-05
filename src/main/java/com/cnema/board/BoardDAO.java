package com.cnema.board;

import java.util.List;

import com.cnema.util.RowNum;

public interface BoardDAO {
	//selectList
		public List<BoardDTO> selectList(RowNum rowNum) throws Exception;
		
		//selectOne
		public BoardDTO selectOne(int num) throws Exception;
		
		//insert
		public int insert(BoardDTO boardDTO) throws Exception;
		
		//update
		public int update(BoardDTO boardDTO) throws Exception;
		
		//delete
		public int delete(int num) throws Exception;
		
		//totalCount
		public int totalCount(RowNum rowNum) throws Exception;
		
		//hitUpdate
		public int hitUpdate(int num) throws Exception;
		
		//getNum
		public int getNum() throws Exception;
}
