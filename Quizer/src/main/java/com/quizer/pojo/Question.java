package com.quizer.pojo;

import java.util.ArrayList;

public class Question {
	private String title;
	private ArrayList<Answer> answerList;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public ArrayList<Answer> getAnswers() {
		return answerList;
	}
	public void add(Answer answer) {
		if (answerList == null) {
			answerList = new ArrayList<Answer>();
		}
		
		answerList.add(answer);
	}
	
	public void setAnswerList(ArrayList<Answer> answerList) {
		this.answerList = answerList;
	}
}
