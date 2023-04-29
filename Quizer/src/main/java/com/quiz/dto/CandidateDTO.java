package com.quiz.dto;

import java.util.ArrayList;

import com.database.QuizDAO;

public class CandidateDTO {
	private String name;
	private String hostId;
	private QuizDTO quiz;
	private ArrayList<CandidateQuestionDTO> condidateQuestionDTOList;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHostId() {
		return hostId;
	}

	public void setHostId(String hostId) {
		this.hostId = hostId;
	}
	
	public QuizDTO getQuiz() {
		return quiz;
	}

	public void setQuiz(QuizDTO quiz) {
		this.quiz = quiz;
	}

	public ArrayList<CandidateQuestionDTO> getCondidateQuestionDTOList() {
		return condidateQuestionDTOList;
	}

	public void setCondidateQuestionDTOList(ArrayList<CandidateQuestionDTO> condidateQuestionDTOList) {
		this.condidateQuestionDTOList = condidateQuestionDTOList;
	}
}
