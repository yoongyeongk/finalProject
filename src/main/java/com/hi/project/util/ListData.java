package com.hi.project.util;

public class ListData {
	private int curPage;
	private String kind;
	private String search;
	private int perPage; //�?�??��?���? ?��?��?���? 말�?�? ?��?��?�� 컨트롤러?��?�� 받아?�� �? 말�? 결정
	
	public ListData() {
		// TODO Auto-generated constructor stub
		this.curPage = 1;
		this.kind = "전체";
		this.search = "";
		this.perPage = 10;
	}
	
	//row 1
	public RowNum makeRow(){
		RowNum rowNum = new RowNum();
		rowNum.setStartRow((curPage-1)*perPage+1);
		rowNum.setLastRow(curPage*perPage);
		rowNum.setKind(kind);
		rowNum.setSearch(search);
		
		return rowNum;
	}
	
	//row 2 - reply
	public RowNum makeRow(int num){
		RowNum rowNum = new RowNum();
		int perPage = 5;
		rowNum.setStartRow((curPage-1)*perPage+1);
		rowNum.setLastRow(curPage*perPage);
		rowNum.setKind(kind);
		rowNum.setSearch(search);
		rowNum.setNum(num);
		
		return rowNum;
	}
	
	//page
	public Pager makePage(int totalCount){
		Pager pager = new Pager();
		int perBlock = 5; //?��것도 �?�?/고정 ?���?�? 결정?��?�� 받아?���? 결정
		
		//1. totalCount�? totalPage 계산
		int totalPage = 0;
		if(totalCount%perPage == 0){
			totalPage = totalCount/perPage;
		}else{
			totalPage = totalCount/perPage+1;
		}
		//2. totalPage�? totalBlock 계산
		if(totalPage%perBlock == 0){
			pager.setTotalBlock(totalPage/perBlock);
		}else{
			pager.setTotalBlock(totalPage/perBlock+1);
		}
		//3. curPage�? curBlock 계산
		if(curPage%perBlock == 0){
			pager.setCurBlock(curPage/perBlock);
		}else{
			pager.setCurBlock(curPage/perBlock+1);
		}
		//4. curBlock?���? startNum, lastNum 계산
		pager.setStartNum((pager.getCurBlock()-1)*perBlock+1);
		pager.setLastNum(pager.getCurBlock()*perBlock);
		//5. curBlock?�� 마�?�? Block?�� ?�� lastNum 처리
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
