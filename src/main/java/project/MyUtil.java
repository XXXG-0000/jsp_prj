package project;

public class MyUtil {

	// 전체 페이지
	public int getPageCount(int numPerPage, int dataCount) {
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0) {
			pageCount++;
		}
		
		return pageCount;
	}
}
