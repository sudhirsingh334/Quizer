package com.quiz.dto;

import java.util.ArrayList;

public class QuizResults {
	private ArrayList<QuizHostDTO> hostList;

	public ArrayList<QuizHostDTO> getHostList() {
		return hostList;
	}

	public void setHostList(ArrayList<QuizHostDTO> hostList) {
		this.hostList = hostList;
	}

	public void add(QuizHostDTO quizHost) {
		if (hostList == null) {
			hostList = new ArrayList<QuizHostDTO>();
		}

		hostList.add(quizHost);
	}
}
