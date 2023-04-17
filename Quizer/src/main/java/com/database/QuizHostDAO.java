package com.database;

public class QuizHostDAO {
	 private String id;
	 private String quizCode;
	 private String quizId;
	 private String hostedAt;
	 private QuizHostState state;
	 
	 public QuizHostState getState() {
		return state;
	}
	public void setState(QuizHostState state) {
		this.state = state;
	}
	public QuizHostDAO() {}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQuizCode() {
		return quizCode;
	}
	public void setQuizCode(String quizCode) {
		this.quizCode = quizCode;
	}
	public String getQuizId() {
		return quizId;
	}
	public void setQuizId(String quizId) {
		this.quizId = quizId;
	}
	public String getHostedAt() {
		return hostedAt;
	}
	public void setHostedAt(String hostedAt) {
		this.hostedAt = hostedAt;
	}
	 
	 
	 
}
