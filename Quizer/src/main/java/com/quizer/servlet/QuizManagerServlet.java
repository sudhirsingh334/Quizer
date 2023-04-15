package com.quizer.servlet;

import java.io.IOException;

import com.quizer.pojo.Quiz;
import com.quizer.service.PersistentHelper;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class QuizManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String quizName = request.getParameter("quizname");

		if (quizName != null){
			Quiz quiz = PersistentHelper.singleton.getQuiz(quizName);

			if (quiz == null) {
				//Proceed Next with adding question
				RequestDispatcher rd =request.getRequestDispatcher("addquestion.jsp");
				quiz = new Quiz();
				quiz.setName(quizName);

				HttpSession session=request.getSession(true); 
				session.setAttribute("Quiz", quiz);

				rd.include(request,response);
			} else {
				//Show error
				String errorMessage = String.format("Quiz already exist with %s. Please choose different quiz name.", quizName);
				request.setAttribute("ERRORMESSAGE",errorMessage);

				RequestDispatcher  rd=request.getRequestDispatcher("createquiz.jsp");
				rd.include(request,response);
			}
		}
	}

}
