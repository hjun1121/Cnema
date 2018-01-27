package com.cnema.reserve;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.util.RowNum;

@Repository
public class ReserveDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="reserveMapper.";
	
	public List<Integer> seatCheck(int screen_num, int schedule_num) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("screen_num", screen_num);
		map.put("schedule_num", schedule_num);
		return sqlSession.selectList(NAMESPACE+"seatCheck", map);
	}
	
	public int reserveInsert(ReserveDTO reserveDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"reserveInsert", reserveDTO);
	}

	/*heeseong*/
	public int rTotalCount(String id,String kind) throws Exception{
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("id", id);
		rMap.put("kind", kind);
		return sqlSession.selectOne(NAMESPACE+"rTotalCount",rMap);
	}
	/*heeseong*/
	public List<ReserveDTO> reserveList(String id,String kind,RowNum rowNum) throws Exception{
		System.out.println("kind"+kind);
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("id", id);
		rMap.put("kind", kind);
		rMap.put("rowNum", rowNum);
		return sqlSession.selectList(NAMESPACE+"reserveList",rMap);
		/*Map<String, Object> rMap = new HashMap<>();
		rMap.put("id", id);
		rMap.put("kind", kind);
		return sqlSession.selectList(NAMESPACE+"reserveList", rMap);*/
	}
	/*heeseong*/
	public List<ReserveDTO> reserveAList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"reserveAList", id);
	}
	/*heeseong*/
	public ReserveDTO reserveBList(String id,int tp_num) throws Exception{
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("id", id);
		rMap.put("tp_num", tp_num);
		return sqlSession.selectOne(NAMESPACE+"reserveBList", rMap);
	}
	/*heeseong*/
	public int reserveDel(int tp_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"reserveDel",tp_num);
	}
	/*heeseong*/
	public List<ReserveDTO> selectList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList", id);
	}

	public int reserveLeftbar(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"reserveLeftbar", id);
	}
}
