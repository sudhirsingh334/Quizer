package com.quizer.servlet;

import java.io.IOException;
import java.util.Enumeration;

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
		String quizId = request.getParameter("start-button");
		Enumeration<String> en = request.getParameterNames();
		
		 System.out.println("printing enum");  
		 
		while(en.hasMoreElements()){  
            System.out.println(en.nextElement());  
       }       
		String quizCode = null;

		int codeGenLoop = 0;
		int maxCodeGenRetry = 15;
		
		do {
			quizCode = QuizCodeGenerator.shared.generateQuizCode(6);
			++codeGenLoop;
		} while(quizCode == null || PersistentHelper.singleton.isQuizAlreadyHostedWithCode(quizCode) || codeGenLoop>=maxCodeGenRetry);
		
		HttpSession  session = request.getSession(true);
		if (session == null || quizId == null || quizCode == null) {
			response.getWriter().print("Session expired. <a href='login.html'><input type='submit'class='button' value='Submit'>Click here to restart.</a>");
			return;
		}

		session.setAttribute("current-quiz-id", quizId);
		session.setAttribute("current-quiz-code", quizCode);
		System.out.print("current-quiz-code"+quizCode);
		RequestDispatcher  rd=request.getRequestDispatcher("startQuiz.jsp");
		
		rd.include(request,response);
	}
}
