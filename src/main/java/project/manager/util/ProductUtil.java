package project.manager.util;

import project.manager.menu.SearchVO;

public class ProductUtil {

	public String pagination(SearchVO sVO) {
		StringBuilder pagination = new StringBuilder();
		//1. 한 화면에 보여줄 페이지 인덱스의 수 설정
		int pageNumber = 3; // [1][2][3]
		//2. 화면에 보여줄 시작페이지 번호
		int startPage = ((sVO.getCurrentPage() - 1) / pageNumber)*pageNumber + 1;
		//3. 화면에 보여줄 마지막 페이지 번호
		int endPage = startPage + pageNumber - 1;
		//4. 총 페이지 수가 연산된 마지막 페이지 수보다 작다면 총 페이지 수가 마지막 페이지 수로 설정
		if(sVO.getTotalPage() <= endPage){
			endPage = sVO.getTotalPage();
		}//end if
		//5. 첫 페이지가 인덱스 화면이 아닌 경우(3보다 큰 경우)
		int movePage = 0;
		StringBuilder prevMark = new StringBuilder();
		prevMark.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#\"><i class=\"bi bi-chevron-double-left\" title=\"이전으로\"></i></a>");
		
		if(sVO.getCurrentPage() > pageNumber){// 현재 페이지가 pagination의 수보다 크면
			prevMark.delete(0, prevMark.length());
			//이전으로 가기 링크를 활성화
			movePage = startPage - 1;//1,4,7,...
			prevMark.append("[ <a href=\"")
			.append(sVO.getUrl())
			.append("?currentPage=")
			.append(movePage);
			
			//검색 keyword가 존재할 때
			if(sVO.getKeyword() != null && !"".equals(sVO.getKeyword())) {
				prevMark.append("&field=")
				.append(sVO.getField())
				.append("&keyword=")
				.append(sVO.getKeyword())
				;
			}
			
			prevMark.append("\"> &lt;&lt;</a> ]");
		}//end if
		
		
		return pagination.toString();
	}
	
}
