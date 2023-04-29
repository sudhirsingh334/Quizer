package com.quiz.dto;

import java.util.ArrayList;

public class CandidateQuestionDTO {
	private String title;
	private ArrayList<AnswerDTO> answerDTO;
	private AnswerDTO selectedAnswerDTO;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public ArrayList<AnswerDTO> getAnswerDTO() {
		return answerDTO;
	}

	public void setAnswerDTO(ArrayList<AnswerDTO> answerDTO) {
		this.answerDTO = answerDTO;
	}

	public AnswerDTO getSelectedAnswerDTO() {
		return selectedAnswerDTO;
	}

	public void setSelectedAnswerDTO(AnswerDTO selectedAnswerDTO) {
		this.selectedAnswerDTO = selectedAnswerDTO;
	}

}
