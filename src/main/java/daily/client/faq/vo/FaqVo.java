package daily.client.faq.vo;

public class FaqVo {
	private	int			faq_num;		// 자주하는 질문 고유번호
	private	String		faq_question;	// 자주하는 질문글
	private	String		faq_answer;		// 자주하는 질문 답변글
	
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_question() {
		return faq_question;
	}
	public void setFaq_question(String faq_question) {
		this.faq_question = faq_question;
	}
	public String getFaq_answer() {
		return faq_answer;
	}
	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}
	
}
