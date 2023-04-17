package com.quizer.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.database.QuizHostDAO;
import com.database.QuizHostState;
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
		String nextPage = "startQuiz.jsp";
		
		response.setContentType("text/html");
		
		
		if (session == null) {
			response.getWriter().write(
					"Session expired. <a href='index.jsp'>Click here to restart.</a>");
			return;
		}
		
		QuizHostDAO quizHost = (QuizHostDAO) session.getAttribute("HostQuiz");

		if (session == null || quizHost == null) {
			response.getWriter().print(
					"Session expired. <a href='login.html'><input type='submit'class='button' value='Submit'>Click here to restart.</a>");
			return;
		}
		
		QuizHostState quizHostStateOld = quizHost.getState();
		
		//Change the state of hosted quiz based on button title;
		String button = request.getParameter("quiz-start-button");
		
		if (button.equalsIgnoreCase("Start") && quizHost.getState() == QuizHostState.NotStarted) {
			//Start Quiz
			quizHost.setState(QuizHostState.Started);
		} else if (button.equalsIgnoreCase("Pause") && (quizHost.getState() == QuizHostState.Started  || quizHost.getState() == QuizHostState.Resumed)) {
			//Pause the quiz
			quizHost.setState(QuizHostState.Paused);
		} else if (button.equalsIgnoreCase("Resume") && quizHost.getState() == QuizHostState.Paused) {
			//Stop the quiz
			quizHost.setState(QuizHostState.Resumed);
		} else if (button.equalsIgnoreCase("Stop") && quizHost.getState() != QuizHostState.NotStarted) {
			quizHost.setState(QuizHostState.Stopped);
		} else if (button.equalsIgnoreCase("Show Result") && quizHost.getState() != QuizHostState.Stopped) {
			nextPage = "showQuizResult.jsp";
		}
		
		if (quizHostStateOld != quizHost.getState()) {
			//Update the QuizHost
			PersistentHelper.singleton.updateQuizHost(quizHost);
		}

		
		RequestDispatcher rd = request.getRequestDispatcher(nextPage);
		rd.include(request, response);
		
		if (button.equalsIgnoreCase("Stop")) {
			session.invalidate();
		}
	}
}
