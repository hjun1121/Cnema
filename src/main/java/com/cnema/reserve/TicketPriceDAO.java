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
	/*heeseong*/
	public TicketPriceDTO ticketPInfo(int tp_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"ticketPInfo", tp_num);
	}
}
