package com.hi.project.util;

public class ListData {
	private int curPage;
	private String kind;
	private String search;
	private int perPage; //Í∞?Î≥??†Å?úºÎ°? ?Ç¨?ö©?ï†Ïß? ÎßêÏ?Î•? ?†ï?ï¥?Ñú Ïª®Ìä∏Î°§Îü¨?óê?Ñú Î∞õÏïÑ?ò¨ Ïß? ÎßêÏ? Í≤∞Ï†ï
	
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
		int perBlock = 5; //?ù¥Í≤ÉÎèÑ Í∞?Î≥?/Í≥†Ï†ï ?ó¨Î∂?Î•? Í≤∞Ï†ï?ïò?ó¨ Î∞õÏïÑ?ò¨Ïß? Í≤∞Ï†ï
		
		//1. totalCountÎ°? totalPage Í≥ÑÏÇ∞
		int totalPage = 0;
		if(totalCount%perPage == 0){
			totalPage = totalCount/perPage;
		}else{
			totalPage = totalCount/perPage+1;
		}
		//2. totalPageÎ°? totalBlock Í≥ÑÏÇ∞
		if(totalPage%perBlock == 0){
			pager.setTotalBlock(totalPage/perBlock);
		}else{
			pager.setTotalBlock(totalPage/perBlock+1);
		}
		//3. curPageÎ°? curBlock Í≥ÑÏÇ∞
		if(curPage%perBlock == 0){
			pager.setCurBlock(curPage/perBlock);
		}else{
			pager.setCurBlock(curPage/perBlock+1);
		}
		//4. curBlock?úºÎ°? startNum, lastNum Í≥ÑÏÇ∞
		pager.setStartNum((pager.getCurBlock()-1)*perBlock+1);
		pager.setLastNum(pager.getCurBlock()*perBlock);
		//5. curBlock?ù¥ ÎßàÏ?Îß? Block?ùº ?ïå lastNum Ï≤òÎ¶¨
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
