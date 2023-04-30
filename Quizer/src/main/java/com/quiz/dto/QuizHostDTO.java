package com.quiz.dto;

import java.util.ArrayList;

import com.database.QuizHostState;

public class QuizHostDTO {
	private String id;
	private String code;
	private QuizHostState status;
	private String hostedAt;
	private ArrayList<ResultCandidate> candidateList;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public QuizHostState getStatus() {
		return status;
	}
	public void setStatus(QuizHostState status) {
		this.status = status;
	}
	public String getHostedAt() {
		return hostedAt;
	}
	public void setHostedAt(String hostedAt) {
		this.hostedAt = hostedAt;
	}
	public ArrayList<ResultCandidate> getCandidateList() {
		return candidateList;
	}
	public void setCandidateList(ArrayList<ResultCandidate> candidateList) {
		this.candidateList = candidateList;
	}

}
