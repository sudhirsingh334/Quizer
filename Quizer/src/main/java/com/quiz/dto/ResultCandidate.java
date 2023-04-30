package com.quiz.dto;

import java.util.ArrayList;

public class ResultCandidate {
	private String id;
	private String name;
	private ArrayList<CandidateQuestionDTO> attemptedQuestionList;

	public ResultCandidate(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<CandidateQuestionDTO> getAttemptedQuestionList() {
		return attemptedQuestionList;
	}

	public void setAttemptedQuestionList(ArrayList<CandidateQuestionDTO> attemptedQuestionList) {
		this.attemptedQuestionList = attemptedQuestionList;
	}
}
