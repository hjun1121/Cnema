package com.cnema.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.member.MemberDTO;
import com.cnema.message.MessageDTO;
import com.cnema.util.RowNum;


@Repository
public class PageDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "pageMapper.";
	
	
	//쪽지 쓰기
	public int mailSend(MessageDTO messageDTO) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("messageDTO", messageDTO);
		return sqlSession.insert(NAMESPACE+"mailSend", map);
	}
	
	//멤버 프로필
	public List<MemberDTO> pageMemberProfile(int page_num, String search) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("page_num", page_num);
		map.put("search", search);
		return sqlSession.selectList(NAMESPACE+"pageMemberProfile", map);
	}
	
	
	//추천 페이지
	public List<PageDTO> recommendPageList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"recommendPageList");
	}
	
	//가입한 페이지
	public List<PageDTO> joinPageList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+"joinPageList", id);
	}
	
	//발신함
	public List<MessageDTO> selectSendMail(String id, RowNum rowNum) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("rowNum", rowNum);
		return sqlSession.selectList(NAMESPACE+"selectSendMail", map);
	}
	public int sendMailTotalCount(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"sendMailTotalCount", id);
	}
	
	//안읽은 쪽지
	public int mailCount(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"mailCount", id);
	}
	
	//쪽지 수신
	public MessageDTO selectMailOne(int message_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectMailOne", message_num);
	}
	public int mailRead(int message_num) throws Exception {
		return sqlSession.update(NAMESPACE+"mailRead", message_num);
	}
	
	//쪽지함
	public List<MessageDTO> mailReceive(String id, RowNum rowNum) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("rowNum", rowNum);
		return sqlSession.selectList(NAMESPACE+"mailReceive", map);
	}
	
	public int mailTotalCount(String id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		return sqlSession.selectOne(NAMESPACE+"mailTotalCount", map);
	}
	
	//selectPageMemberOne
	public PageMemberDTO selectPageMemberOne(String id, int page_num) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("page_num", page_num);
		return sqlSession.selectOne(NAMESPACE+"selectPageMemberOne", map);
	}
	
	
	//pageContentsWrite
	public int pageContentsWrite(PageContentsDTO pageContentsDTO){
		return sqlSession.update(NAMESPACE+"pageContentsWrite", pageContentsDTO);
	}
	//scrolling
	public List<PageContentsDTO> pageContentsList(int page){
		return sqlSession.selectList(NAMESPACE+"pageContentsList", page);
	}
	
	
	//memberDropCount
	public int memberDropCount(int page_num) throws Exception {
		return sqlSession.update(NAMESPACE+"memberDropCount", page_num);
	}
	
	
	//memberDrop
	public int memberDrop(int page_num, String id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("page_num", page_num);
		map.put("id", id);
		return sqlSession.delete(NAMESPACE+"memberDrop", map);
	}
	
	
	//memberCheck
	public PageMemberDTO memberCheck(int page_num, String id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("page_num", page_num);
		map.put("id", id);
		return sqlSession.selectOne(NAMESPACE+"memberCheck", map);
	}

	//selectPageMember
	public List<PageMemberDTO> selectPageMemberList(int page_num) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectPageMemberList", page_num);
	}
	
	//pageInsert
	public int pageInsert(PageDTO pageDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"pageInsert", pageDTO);
	}
	
	//memberInsert
	public int memberInsert(PageDTO pageDTO, String id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("pageDTO", pageDTO);
		map.put("id", id);
		return sqlSession.insert(NAMESPACE+"memberInsert", map);
	}

	
	//memberCount
	public int memberCount(int page_num) throws Exception {
		return sqlSession.update(NAMESPACE+"memberCount", page_num);
	}
	
	//selectPageOne
	public PageDTO selectPageOne(int page_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectPageOne", page_num);
	}

	//selectRecommendPage
	public List<PageDTO> recommendPageList(String search) throws Exception {
		return sqlSession.selectList(NAMESPACE+"recommendPageList",search);
	}
	
	//selectPageList 가입 페이지 목록
	public List<PageDTO> selectPageList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectPageList", id);
	}
	
	//pageLike
	public int pageContentsLike(int contents_num) {
		return sqlSession.update(NAMESPACE+"pageContentsLike", contents_num);
	}

	public int pageContentsWarning(int contents_num) {
		return sqlSession.update(NAMESPACE+"pageContentsWarning", contents_num);
	}
	//페이지글 삭제
	public int pageContentsDelete(int contents_num) {
		return sqlSession.update(NAMESPACE+"pageContentsDelete", contents_num);
	}
}
