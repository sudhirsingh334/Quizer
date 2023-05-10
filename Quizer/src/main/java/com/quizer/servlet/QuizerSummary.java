package com.quizer.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.quiz.dto.QuizResults;
import com.quiz.dto.ResultCandidate;
import com.quizer.service.PersistentHelper;

import jakarta.servlet.http.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

public class QuizerSummary extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String candidateID = request.getParameter("download");
		ResultCandidate candidate = PersistentHelper.singleton.getCandidate(candidateID);
		
		HttpSession httpSession = request.getSession();
		
		if (httpSession != null) {
			httpSession.setAttribute("Candidate", candidate);
		}
		
		RequestDispatcher  rd=request.getRequestDispatcher("createQuizSummary.jsp");
		rd.include(request,response);
	}
}
