package com.quiz.dto;

public class CandidateDTO {
	private String hostedAt;
	private String quizId;
	private CandidateQuestionDTO condidateDTOList;

	public String getHostedAt() {
		return hostedAt;
	}

	public void setHostedAt(String hostedAt) {
		this.hostedAt = hostedAt;
	}

	public String getQuizId() {
		return quizId;
	}

	public void setQuizId(String quizId) {
		this.quizId = quizId;
	}

	public CandidateQuestionDTO getCondidateDTOList() {
		return condidateDTOList;
	}

	public void setCondidateDTOList(CandidateQuestionDTO condidateDTOList) {
		this.condidateDTOList = condidateDTOList;
	}

}
