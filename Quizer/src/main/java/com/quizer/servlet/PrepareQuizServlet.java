package com.quizer.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.UUID;

import com.database.QuizHostDAO;
import com.database.QuizHostState;
import com.quizer.service.PersistentHelper;
import com.quizer.utilities.QuizCodeGenerator;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PrepareQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession  session = request.getSession(true);

		QuizHostDAO quizHost = (QuizHostDAO) session.getAttribute("HostQuiz");
		
		if (quizHost != null) {
			//Quiz already hosted
			RequestDispatcher  rd=request.getRequestDispatcher("startQuiz.jsp");
			rd.include(request,response);
			return;
		}
		
		String quizId = request.getParameter("start-button");   
		String quizCode = null;

		int codeGenLoop = 0;
		int maxCodeGenRetry = 15;
		
		do {
			quizCode = QuizCodeGenerator.shared.generateQuizCode(6);
			++codeGenLoop;
		} while(quizCode == null || PersistentHelper.singleton.isQuizAlreadyHostedWithCode(quizCode) || codeGenLoop>=maxCodeGenRetry);
				
		if (session == null || quizId == null || quizCode == null) {
			response.getWriter().print("Session expired. <a href='login.html'><input type='submit'class='button' value='Submit'>Click here to restart.</a>");
			return;
		}

		String hostId = UUID.randomUUID().toString();
		String timestamp = new Timestamp(System.currentTimeMillis()).toString();

		quizHost = new QuizHostDAO();

		quizHost.setId(hostId);
		quizHost.setQuizId(quizId);
		quizHost.setQuizCode(quizCode);
		quizHost.setHostedAt(timestamp);
		quizHost.setState(QuizHostState.NotStarted);
		
		if (PersistentHelper.singleton.saveQuizHost(quizHost)) {
			// Start Quiz Session
			session.setAttribute("HostQuiz", quizHost);
		} else {
			session.setAttribute("HostQuiz", null);
		}
		
		RequestDispatcher  rd=request.getRequestDispatcher("startQuiz.jsp");
		rd.include(request,response);
	}
}
