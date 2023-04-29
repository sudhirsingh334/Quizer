package com.quiz.dto;

import java.util.ArrayList;

import com.quizer.pojo.Question;

public class QuizDTO {
	private String id;
	private String name;
	private ArrayList<CandidateQuestionDTO> condidateQuestionDTOList;
	
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
	public ArrayList<CandidateQuestionDTO> getCondidateQuestionDTOList() {
		return condidateQuestionDTOList;
	}
	public void setCondidateQuestionDTOList(ArrayList<CandidateQuestionDTO> condidateQuestionDTOList) {
		this.condidateQuestionDTOList = condidateQuestionDTOList;
	}
	
	public void add(CandidateQuestionDTO qsn) {
		if (condidateQuestionDTOList == null) {
			condidateQuestionDTOList = new ArrayList<CandidateQuestionDTO>();
		}
		
		condidateQuestionDTOList.add(qsn);
	}
}
