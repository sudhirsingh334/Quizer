package com.quiz.dto;

import java.util.ArrayList;

import com.quizer.pojo.Answer;

public class CandidateQuestionDTO {
	private String id;
	private String title;
	private ArrayList<AnswerDTO> answerDTOList;
	private AnswerDTO selectedAnswerDTO;

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public ArrayList<AnswerDTO> getAnswerDTOList() {
		return answerDTOList;
	}

	public void setAnswerDTOList(ArrayList<AnswerDTO> answerDTOList) {
		this.answerDTOList = answerDTOList;
	}
	
	public void add(AnswerDTO answer) {
		if (answerDTOList == null) {
			answerDTOList = new ArrayList<AnswerDTO>();
		}
		
		answerDTOList.add(answer);
	}

	public AnswerDTO getSelectedAnswerDTO() {
		return selectedAnswerDTO;
	}

	public void setSelectedAnswerDTO(AnswerDTO selectedAnswerDTO) {
		this.selectedAnswerDTO = selectedAnswerDTO;
	}

}
