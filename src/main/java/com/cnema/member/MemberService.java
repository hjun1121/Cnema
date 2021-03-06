package com.cnema.member;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.coupon.CouponDAO;
import com.cnema.coupon.CouponDTO;
import com.cnema.coupon.CoupongroupDAO;
import com.cnema.coupon.CoupongroupDTO;
import com.cnema.coupon.MyCouponDAO;
import com.cnema.util.FileSaver;
import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;

import oracle.net.aso.c;

@Service
@Transactional
public class MemberService {
	@Inject
	private MemberDAO memberDAO;
	@Inject
	private CoupongroupDAO coupongroupDAO;
	@Inject
	private MyCouponDAO myCouponDAO;
	@Inject
	private CouponDAO couponDAO;
	
	@Inject
	private FileSaver fileSaver;
	
	/*kim*/
	public int pwUpdate(MemberDTO memberDTO){
		return memberDAO.pwUpdate(memberDTO);
	}
	
	public int qrPointUpdate(int point, int getPoint, String id) throws Exception{
		return memberDAO.qrPointUpdate(point, getPoint, id);
	}
	
	public List<MemberDTO> idFind(MemberDTO memberDTO) throws Exception{
		return memberDAO.idFind(memberDTO);
	}
	
	public int pwFind(MemberDTO memberDTO) throws Exception{
		return memberDAO.pwFind(memberDTO);
	}
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception{
		return memberDAO.login(memberDTO);
	}

	public int join(MemberDTO memberDTO, HttpSession session) throws Exception{
		if(memberDTO.getFile().getOriginalFilename() ==""){
			memberDTO.setFileName("defaultProfile.jpg");
			memberDTO.setOriName("defaultProfile.jpg");
		}else{
			MultipartFile file = memberDTO.getFile();
			String name = fileSaver.fileSave(file, session, "profil");
			memberDTO.setFileName(name);
			memberDTO.setOriName(file.getOriginalFilename());
		}
		int result = memberDAO.join(memberDTO);
		
		return result;
	}
	
	
	
	/*heeseong*/
	public MemberDTO memberInfo(String id) throws Exception{
		return memberDAO.memberInfo(id);
	}
	/*heeseong*/
	/*public List<MemberDTO> memberList() throws Exception{
		return memberDAO.memberList();
	}*/
	public int mTotalCount(int kind) throws Exception{
		return memberDAO.mTotalCount(kind);
	}
	/*heeseong*/
	public ModelAndView memberList(int kind,int group_num,ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		
		Pager pager = listData.makePage(memberDAO.mTotalCount(kind));
		
		List<MemberDTO> memList = new ArrayList<>();
		List<CoupongroupDTO> gList = new ArrayList<>();
		MemberDTO memberDTO = new MemberDTO();
		List<CoupongroupDTO> groupList = new ArrayList<>();
		groupList = coupongroupDAO.groupAList();
		if (group_num == -1) {
			memList = memberDAO.memberList(kind, rowNum);
		} else {
			gList = coupongroupDAO.groupSList(group_num);
			for (int num = 0; num < gList.size(); num++) {
				memberDTO = memberDAO.memberInfo(gList.get(num).getId());
				memList.add(memberDTO);
			}
		}
		int result = 0;
		int number = 1;
		for (MemberDTO memberDTO2 : memList) {
			result = myCouponDAO.couponCount(memberDTO2.getId());
			mv.addObject("result" + number, result);
			number++;
		}
		
		List<CouponDTO> cList = new ArrayList<>();
		cList = couponDAO.couponAList();
		mv.addObject("cList", cList);
		mv.addObject("groupList", groupList);
		mv.addObject("memList", memList);
		mv.addObject("pager",pager);
		return mv;
		/*return memberDAO.memberList(kind);*/
	}
	/*heeseong*/
	public List<MemberDTO> memberCList(int ctype) throws Exception{
		return memberDAO.memberCList(ctype);
	}
	/*heeseong*/
	public int withdrawal(String id) throws Exception{
		return memberDAO.withdrawal(id);
	}
	/*heeseong*/
	public int myInfoRevision(MemberDTO memberDTO, HttpSession session) throws Exception{
		if(memberDTO.getFile() !=null){
			//있던애 지워야함
			String filePath = session.getServletContext().getRealPath("resources/profil");
			File file = new File(filePath, memberDTO.getFileName());
			if(file.getName().equals("defaultProfile.jpg")){
				
			}else{
				if(file.exists()){
					file.delete();
				}
			}
			if(memberDTO.getFile().getOriginalFilename() == ""){
				//디폴트 쓰겟다 디폴트 넣어주기
				memberDTO.setFileName("defaultProfile.jpg");
				memberDTO.setOriName("defaultProfile.jpg");
			}else{
				//새로운거 쓰겟다 file 세이버 하기 
				memberDTO.setOriName(memberDTO.getFile().getOriginalFilename());
				String fileName = fileSaver.fileSave(memberDTO.getFile(), session, "profil");
				memberDTO.setFileName(fileName);
			}
		}else{
			//그대로쓰겟다 암것두안하면댐
		}
		int result = memberDAO.myInfoRevision(memberDTO);
		if(result>0){
			session.setAttribute("member", memberDTO);
		}
				
		return result;
	}
	/*heeseong*/
	public int pointUpdate(int price, String id) throws Exception{
		return memberDAO.pointUpdate(price,id);
	}
}
