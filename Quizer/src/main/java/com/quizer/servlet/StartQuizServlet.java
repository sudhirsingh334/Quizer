package com.quizer.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.UUID;

import com.database.QuizHostDAO;
import com.quizer.service.PersistentHelper;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class StartQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StartQuizServlet() {
		super();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null) {
			response.getWriter().print(
					"Session expired. <a href='login.html'><input type='submit'class='button' value='Submit'>Click here to restart.</a>");
			return;
		}
		String quizCode = (String) session.getAttribute("current-quiz-code");
		String quizId = (String) session.getAttribute("current-quiz-id");
		String hostId = UUID.randomUUID().toString();
		String timestamp = new Timestamp(System.currentTimeMillis()).toString();
		session.setAttribute("TriedStartingQuizSession", true);

		if (session == null || quizId == null || quizCode == null || hostId == null | timestamp == null) {
			response.getWriter().print(
					"Session expired. <a href='login.html'><input type='submit'class='button' value='Submit'>Click here to restart.</a>");
			return;
		}
		
		QuizHostDAO quizHost = new QuizHostDAO();
		
		quizHost.setId(hostId);
		quizHost.setQuizId(quizId);
		quizHost.setQuizCode(quizCode);
		quizHost.setHostedAt(timestamp);
		
		if (PersistentHelper.singleton.saveQuizHost(quizHost)) {
			//Start Quiz Session
			session.setAttribute("HostQuiz", quizHost);
			session.setAttribute("QuizSessionStarted", true);
		} else {
			session.setAttribute("HostQuiz", null);
			session.setAttribute("QuizSessionStarted", false);
		}
		
		RequestDispatcher  rd=request.getRequestDispatcher("startQuiz.jsp");
		rd.include(request,response);
	}
}
