package com.xyz.tool;

import java.util.ArrayList;
import java.util.List;

public class PaginationHelper<T> {

	
	private List<T> list;
	private List<T> currentList=new ArrayList<T>();
	private int count_Total;
	private int count_Page=1;
	private int pageSize;
	private int currentPage;

	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public PaginationHelper(List<T> list, int pageSize) {
		
		this.list = list;
		count_Total = list.size();
		this.pageSize=pageSize;
		if (count_Total % pageSize == 0){
			count_Page = count_Total / pageSize;
		}
		else{
			count_Page = count_Total / pageSize + 1;
		}
		

	}

	
	public int getCount_Total() {
		return count_Total;
	}

	public List<T> getSpecifiedPage(int thePage) {
				
		if(thePage>count_Page){
			return currentList;
		}
		currentList.clear();
		currentPage=thePage;
		for(int i=(currentPage-1)*pageSize;i<pageSize*currentPage;i++){
			if(i>=count_Total)break;
			currentList.add(list.get(i));
			System.out.println("i:"+i);
		}

		return currentList;
	}
	
	
	
	public String printCtrl() {
		String strHtml = "<table width='370'  border='0' cellspacing='0' cellpadding='0'><tr> <td height='24' align='right'>当前页数：["
				+ currentPage + "/" + count_Page + "]&nbsp;&nbsp;";
		try {
			if (currentPage > 1) {
				strHtml = strHtml + "<a href='?pageNumber=1'>第一页</a>　";
				strHtml = strHtml + "&nbsp;&nbsp;<a href='?pageNumber=" + (currentPage - 1)
						+ "'>上一页</a>";
			}
			if (currentPage < count_Page) {
				strHtml = strHtml + "&nbsp;&nbsp;<a href='?pageNumber=" + (currentPage + 1)
						+ "'>下一页</a>&nbsp;&nbsp;　<a href='?pageNumber=" + count_Page
						+ "'>最后一页&nbsp;</a>";
			}
			strHtml = strHtml + "</td> </tr>	</table>";
		} catch (Exception e) {
			e.printStackTrace();

		}
		return strHtml;
	}


}
