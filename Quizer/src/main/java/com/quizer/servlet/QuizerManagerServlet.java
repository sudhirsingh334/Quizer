package com.quizer.servlet;

import java.io.IOException;

import com.database.QuizHostDAO;
import com.quizer.service.PersistentHelper;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class QuizerManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String button = request.getParameter("QuizerManager-Button");
		HttpSession session = request.getSession();
		session.setAttribute("User-Tried-To-Join", false);
		String nextPage = "/";

		if (button != null && button.equalsIgnoreCase("Join-Quiz")) {
			// Join Quiz
			// Extract Quiz Code
			session.setAttribute("User-Tried-To-Join", true);
			String quizCode = request.getParameter("QuizCode");
			// Check if quiz code exists in the DB.
			QuizHostDAO quizHost = PersistentHelper.singleton.getQuizHost(quizCode);
			session.setAttribute("QuizHost", quizHost);
			nextPage = "joinQuiz.jsp";
		} else {
			// Unknown Button Pressed.
			System.out.println("QuizerManagerServlet:doPost,unknown button pressed");
		}

		RequestDispatcher rd = request.getRequestDispatcher(nextPage);
		rd.forward(request, response);
	}
}
