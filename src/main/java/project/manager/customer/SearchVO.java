package project.manager.customer;

/**
 * @author : user
 * @fileName : SearchVO
 * @since : 24. 10. 24.
 */
// 시작 번호, 끝 번호, 현재페이지,  + 검색조건
public class SearchVO {
    private int startNum;
    private int endNum;
    private int currentPage;
    private String field = "0";
    private String keyword;


    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getEndNum() {
        return endNum;
    }

    public void setEndNum(int endNum) {
        this.endNum = endNum;
    }

    public int getStartNum() {
        return startNum;
    }

    public void setStartNum(int startNum) {
        this.startNum = startNum;
    }
} // SearchVO 끝

