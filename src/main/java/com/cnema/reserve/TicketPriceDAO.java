package com.cnema.reserve;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TicketPriceDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="ticketPriceMapper.";
	
	public int nextval()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"nextval");
	}
	
	public int tpInsert(TicketPriceDTO ticketPriceDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"tpInsert", ticketPriceDTO);
	}
	
	/*heeseong*/
	public TicketPriceDTO ticketPInfo(int tp_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"ticketPInfo", tp_num);
	}
	/*heeseong*/
	public int ticketRemove(int tp_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"ticketRemove", tp_num);
	}
}
