package project;

public class customDTO {
	private int num;		// 고객의 소리 번호
	private String type;	// 고객의 소리 유형
	private String title;	// 고객의 소리 제목
	private String writer;	// 고객의 소리 작성자
	private String date;	// 고객의 소리 등록일
	private String status;	// 고객의 소리 답변 상태
	private String content;	// 고객의 소리 내용
	private String reply;	// 고객의 소리 답변
	
	// getter setter
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	@Override
	public String toString() {
		return "customDTO [num=" + num + ", type=" + type + ", title=" + title + ", writer=" + writer + ", date=" + date
				+ ", status=" + status + ", content=" + content + ", reply=" + reply + "]";
	}
	
	
}
