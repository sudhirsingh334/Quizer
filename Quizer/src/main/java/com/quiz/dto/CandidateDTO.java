package com.quiz.dto;

import java.util.ArrayList;

import com.database.*;

public class CandidateDTO {
	private String id;
	private String name;
	private QuizHostDAO quizHost;
	private QuizDTO quiz;
	
	
	public CandidateDTO(String id, String name, QuizHostDAO quizHost, QuizDTO quiz) {
		super();
		this.id = id;
		this.name = name;
		this.quizHost = quizHost;
		this.quiz = quiz;
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
	
	public QuizHostDAO getQuizHost() {
		return quizHost;
	}

	public void setQuizHost(QuizHostDAO quizHost) {
		this.quizHost = quizHost;
	}

	public void setName(String name) {
		this.name = name;
	}

	public QuizDTO getQuiz() {
		return quiz;
	}

	public void setQuiz(QuizDTO quiz) {
		this.quiz = quiz;
	}
}
