package com.cnema.util;

public class ListData {
	private int curPage;
	private String kind;
	private String search;
	private int perPage; //가변적으로 사용할지 말지를 정해서 컨트롤러에서 받아올 지 말지 결정
	
	public ListData() {
		// TODO Auto-generated constructor stub
		this.curPage = 1;
		this.kind = "title";
		this.search = "";
		this.perPage = 10;
	}
	
	//row
	public RowNum makeRow(){
		RowNum rowNum = new RowNum();
		rowNum.setStartRow((curPage-1)*perPage+1);
		rowNum.setLastRow(curPage*perPage);
		rowNum.setKind(kind);
		rowNum.setSearch(search);
		
		return rowNum;
	}
	
	//page
	public Pager makePage(int totalCount){
		Pager pager = new Pager();
		int perBlock = 5; //이것도 가변/고정 여부를 결정하여 받아올지 결정
		
		//1. totalCount로 totalPage 계산
		int totalPage = 0;
		if(totalCount%perPage == 0){
			totalPage = totalCount/perPage;
		}else{
			totalPage = totalCount/perPage+1;
		}
		//2. totalPage로 totalBlock 계산
		if(totalPage%perBlock == 0){
			pager.setTotalBlock(totalPage/perBlock);
		}else{
			pager.setTotalBlock(totalPage/perBlock+1);
		}
		//3. curPage로 curBlock 계산
		if(curPage%perBlock == 0){
			pager.setCurBlock(curPage/perBlock);
		}else{
			pager.setCurBlock(curPage/perBlock+1);
		}
		//4. curBlock으로 startNum, lastNum 계산
		pager.setStartNum((pager.getCurBlock()-1)*perBlock+1);
		pager.setLastNum(pager.getCurBlock()*perBlock);
		//5. curBlock이 마지막 Block일 때 lastNum 처리
		if(pager.getCurBlock() == pager.getTotalBlock()){
			pager.setLastNum(totalPage);
		}

		pager.setKind(kind);
		pager.setSearch(search);
		
		return pager;
	}

	public int getCurPage() {
		/*if(curPage == 0){
			curPage = 1;
		}*/
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public String getKind() {
		/*if(kind == null){
			kind = "title";
		}*/
		return kind;
	}
	public void setKind(String kind) {
			this.kind = kind;
	}
	public String getSearch() {
		/*if(search == null){
			search = "";
		}*/
		return search;
	}
	public void setSearch(String search) {
			this.search = search;
	}

}
