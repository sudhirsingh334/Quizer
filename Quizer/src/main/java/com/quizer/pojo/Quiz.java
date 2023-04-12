package com.quizer.pojo;

import java.util.ArrayList;

public class Quiz {
	private String name;
	private ArrayList<Question> questionList;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public ArrayList<Question> getQuestionList() {
		return questionList;
	}
	
	public void setQuetionList(ArrayList<Question> questionList) {
		this.questionList = questionList;
	}
	
	public void addQuestion(Question question) {
		if (questionList == null) {
			questionList = new ArrayList<Question>();
			//initialising questionList with ArrayList
		} 
		questionList.add(question);
	}
}


