package com.quiz.dto;

public class CandidateQuestionDTO {
	private	String title;
	private	AnswerDTO answerDTO;
	private String selectAnswerDTO;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public AnswerDTO getAnswerDTO() {
		return answerDTO;
	}

	public void setAnswerDTO(AnswerDTO answerDTO) {
		this.answerDTO = answerDTO;
	}

	public String getSelectAnswerDTO() {
		return selectAnswerDTO;
	}

	public void setSelectAnswerDTO(String selectAnswerDTO) {
		this.selectAnswerDTO = selectAnswerDTO;
	}

}
