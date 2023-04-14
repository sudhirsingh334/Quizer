package com.quizer.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

import com.database.QuizDAO;
import com.quizer.pojo.Answer;
import com.quizer.pojo.Question;
import com.quizer.pojo.Quiz;


public class PersistentHelper {

	public static PersistentHelper singleton = new PersistentHelper();

	private PersistentHelper() {
	}

	public boolean save(Quiz quiz) {
		// save quiz into DB
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return false;
			}

			String serverURL = "jdbc:mysql://localhost:3306/quizer";
			String dbUser = "sudhirk";
			String dbPassword = "sudhirk";

			try (Connection connection = DriverManager.getConnection(serverURL, dbUser, dbPassword)) {

				String quizID = UUID.randomUUID().toString();
				try (PreparedStatement stmt = connection
						.prepareStatement("INSERT INTO Quiz (id, title) VALUES (?, ?)")) {
					stmt.setString(1, quizID);
					stmt.setString(2, quiz.getName());
					stmt.executeUpdate();
				}

				Iterator<Question> quetionIT = quiz.getQuestionList().iterator();

				while (quetionIT.hasNext()) {
					Question question = quetionIT.next();

					try (PreparedStatement stmt = connection
							.prepareStatement("INSERT INTO Question (id, title, quizId) VALUES (?, ?, ?)")) {
						String questionID = UUID.randomUUID().toString();
						stmt.setString(1, questionID);
						stmt.setString(2, question.getTitle());
						stmt.setString(3, quizID);
						stmt.executeUpdate();

						Iterator<Answer> answerIT = question.getAnswers().iterator();

						while (answerIT.hasNext()) {
							Answer answer = answerIT.next();

							try (PreparedStatement answerStmt = connection.prepareStatement(
									"INSERT INTO AnswerOption (id, title, isCorrect, questionId) VALUES (?, ?, ?, ?)")) {
								answerStmt.setString(1, UUID.randomUUID().toString());
								answerStmt.setString(2, answer.getTitle());
								answerStmt.setBoolean(3, answer.isCorrect());
								answerStmt.setString(4, questionID);
								answerStmt.executeUpdate();
							} catch (SQLException e) {
								System.out.print("SQL Exception is::" + e.getMessage());
								return false;
							}
						}
					} catch (SQLException e) {
						System.out.print("SQL Exception is::" + e.getMessage());
						return false;
					}
				}
			}

		} catch (SQLException e) {
			System.out.print("SQL Exception is::" + e.getMessage());
			return false;

		}
		return true;
	}
	
	public ArrayList<QuizDAO> getQuizList() {
		ArrayList<QuizDAO> quizList = new ArrayList<QuizDAO>();
		
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return quizList;
			}

			String serverURL = "jdbc:mysql://localhost:3306/quizer";
			String dbUser = "sudhirk";
			String dbPassword = "sudhirk";

			try (Connection connection = DriverManager.getConnection(serverURL, dbUser, dbPassword)) {
				try (PreparedStatement stmt = connection
						.prepareStatement("SELECT * FROM Quiz")) {
					ResultSet rs = stmt.executeQuery();
					
					while (rs.next()) {
						QuizDAO quizDAO = new QuizDAO();
						quizDAO.setId(rs.getString("id"));
						quizDAO.setTitle(rs.getString("title"));
						quizList.add(quizDAO);
					}
				}
			}

		} catch (SQLException e) {
			System.out.print("SQL Exception is::" + e.getMessage());
			return quizList;

		}
		
		return quizList;
	}

}
