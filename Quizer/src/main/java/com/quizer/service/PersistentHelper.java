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
import com.database.QuizHostDAO;
import com.database.QuizHostState;
import com.quiz.dto.AnswerDTO;
import com.quiz.dto.CandidateDTO;
import com.quiz.dto.CandidateQuestionDTO;
import com.quiz.dto.QuizDTO;
import com.quiz.dto.QuizHostDTO;
import com.quiz.dto.QuizResults;
import com.quiz.dto.ResultCandidate;
import com.quizer.pojo.Answer;
import com.quizer.pojo.Question;
import com.quizer.pojo.Quiz;
import com.quizer.utilities.DBConfig;

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

			try (Connection connection = DriverManager.getConnection(DBConfig.url, DBConfig.username,
					DBConfig.password)) {

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

			try (Connection connection = DriverManager.getConnection(DBConfig.url, DBConfig.username,
					DBConfig.password)) {
				try (PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Quiz")) {
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

	public Quiz getQuiz(String quizName) {
		Quiz quiz = null;
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return quiz;
			}

			try (Connection connection = DriverManager.getConnection(DBConfig.url, DBConfig.username,
					DBConfig.password)) {
				try (PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Quiz WHERE title=?")) {
					stmt.setString(1, quizName);
					ResultSet rs = stmt.executeQuery();
					if (rs.next()) {
						String quizTitle = rs.getString("title");

						if (quizTitle != null) {
							quiz = new Quiz();
							quiz.setName(quizTitle);
						}
					}
				}
			}

		} catch (SQLException e) {
			System.out.print("SQL Exception is::" + e.getStackTrace());
			return quiz;

		}
		return quiz;
	}

	public Quiz getQuizById(String quizId) {
		Quiz quiz = null;
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return quiz;
			}

			try (Connection connection = DriverManager.getConnection(DBConfig.url, DBConfig.username,
					DBConfig.password)) {
				try (PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Quiz WHERE id=?")) {
					stmt.setString(1, quizId);
					ResultSet rs = stmt.executeQuery();
					if (rs.next()) {
						String quizTitle = rs.getString("title");
						String id = rs.getString("id");

						if (id != null) {
							quiz = new Quiz();
							quiz.setName(quizTitle);

							// fetch questions
							try (PreparedStatement qsnStmt = connection
									.prepareStatement("SELECT * FROM Question WHERE quizId=?")) {
								qsnStmt.setString(1, id);
								ResultSet qsnRS = qsnStmt.executeQuery();

								while (qsnRS.next()) {

									String qsnId = qsnRS.getString("id");
									Question qsn = new Question();

									qsn.setTitle(qsnRS.getString("title"));

									// fetch Answer Options
									try (PreparedStatement answrStmt = connection
											.prepareStatement("SELECT * FROM AnswerOption WHERE questionId=?")) {
										answrStmt.setString(1, qsnId);
										ResultSet answrRS = answrStmt.executeQuery();

										while (answrRS.next()) {
											String title = answrRS.getString("title");
											boolean isCorrect = answrRS.getString("isCorrect") == "1" ? true : false;

											Answer answr = new Answer(title);
											answr.setCorrect(isCorrect);

											qsn.add(answr);
										}
									}
									quiz.addQuestion(qsn);

								}

							}

						}
					}
				}
			}

		} catch (SQLException e) {
			System.out.print("SQL Exception is::" + e.getStackTrace());
			return quiz;

		}
		return quiz;
	}

	public QuizDTO getQuizDTO(String quizId) {
		QuizDTO quiz = null;
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return quiz;
			}

			try (Connection connection = DriverManager.getConnection(DBConfig.url, DBConfig.username,
					DBConfig.password)) {
				try (PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Quiz WHERE id=?")) {
					stmt.setString(1, quizId);
					ResultSet rs = stmt.executeQuery();
					if (rs.next()) {
						String quizTitle = rs.getString("title");
						String id = rs.getString("id");

						if (id != null) {
							quiz = new QuizDTO();
							quiz.setId(quizId);
							quiz.setName(quizTitle);

							// fetch questions
							try (PreparedStatement qsnStmt = connection
									.prepareStatement("SELECT * FROM Question WHERE quizId=?")) {
								qsnStmt.setString(1, id);
								ResultSet qsnRS = qsnStmt.executeQuery();

								while (qsnRS.next()) {

									String qsnId = qsnRS.getString("id");
									CandidateQuestionDTO qsn = new CandidateQuestionDTO();

									qsn.setId(qsnRS.getString("id"));
									qsn.setTitle(qsnRS.getString("title"));

									// fetch Answer Options
									try (PreparedStatement answrStmt = connection
											.prepareStatement("SELECT * FROM AnswerOption WHERE questionId=?")) {
										answrStmt.setString(1, qsnId);
										ResultSet answrRS = answrStmt.executeQuery();

										while (answrRS.next()) {
											String title = answrRS.getString("title");
											boolean isCorrect = answrRS.getString("isCorrect") == "1" ? true : false;

											AnswerDTO answr = new AnswerDTO();
											answr.setId(answrRS.getString("id"));
											answr.setTitle(title);
											answr.setCorrect(isCorrect);

											qsn.add(answr);
										}
									}
									quiz.add(qsn);

								}

							}

						}
					}
				}
			}

		} catch (SQLException e) {
			System.out.print("SQL Exception is::" + e.getStackTrace());
			return quiz;

		}
		return quiz;
	}

	public boolean isQuizAlreadyHostedWithCode(String quizCode) {
		return this.getQuizHost(quizCode) != null;
	}

	public QuizHostDAO getQuizHost(String quizCode) {
		QuizHostDAO quizHost = null;
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return quizHost;
			}

			try (Connection connection = DriverManager.getConnection(DBConfig.url, DBConfig.username,
					DBConfig.password)) {
				try (PreparedStatement stmt = connection.prepareStatement("SELECT * FROM QuizHost WHERE quizCode=?")) {
					stmt.setString(1, quizCode);
					ResultSet rs = stmt.executeQuery();
					if (rs.next()) {
						String hostId = rs.getString("id");
						String quizId = rs.getString("quizId");
						String hostedAt = rs.getString("hostedAt");
						String hostQuizCode = rs.getString("quizCode");
						String hostQuizStateString = rs.getString("status");

						if (hostQuizCode != null && quizId != null) {
							quizHost = new QuizHostDAO();
							quizHost.setId(hostId);
							quizHost.setQuizCode(hostQuizCode);
							quizHost.setQuizId(quizId);
							quizHost.setHostedAt(hostedAt);
							quizHost.setState(QuizHostState.valueOf(hostQuizStateString));
						}
					}
				}
			}

		} catch (SQLException e) {
			System.out.print("SQL Exception is::" + e.getStackTrace());
			return quizHost;

		}
		return quizHost;
	}

	public boolean saveQuizHost(QuizHostDAO quizHost) {
		boolean status = false;
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return status;
			}

			try (Connection connection = DriverManager.getConnection(DBConfig.url, DBConfig.username,
					DBConfig.password)) {
				try (PreparedStatement stmt = connection.prepareStatement(
						"INSERT INTO QuizHost (id, quizId, hostedAt, quizCode, status) VALUES (?, ?, ?, ?, ?)")) {
					stmt.setString(1, quizHost.getId());
					stmt.setString(2, quizHost.getQuizId());
					stmt.setString(3, quizHost.getHostedAt());
					stmt.setString(4, quizHost.getQuizCode());
					stmt.setString(5, quizHost.getState().name());
					stmt.executeUpdate();
					status = true;
				}
			}

		} catch (SQLException e) {
			System.out.print("SQL Exception is::" + e.getStackTrace());
			return status;

		}
		return status;
	}

	public boolean updateQuizHost(QuizHostDAO quizHost) {
		boolean status = false;
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return status;
			}

			try (Connection connection = DriverManager.getConnection(DBConfig.url, DBConfig.username,
					DBConfig.password)) {
				try (PreparedStatement stmt = connection
						.prepareStatement("UPDATE QuizHost SET status = ? WHERE id = ?")) {
					stmt.setString(1, quizHost.getState().name());
					stmt.setString(2, quizHost.getId());
					stmt.executeUpdate();
					status = true;
				}
			}

		} catch (SQLException e) {
			System.out.print("SQL Exception is::" + e.getStackTrace());
			return status;

		}
		return status;
	}

	public boolean saveCandidate(CandidateDTO candidate) {
		boolean status = false;

		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return false;
			}

			try (Connection connection = DriverManager.getConnection(DBConfig.url, DBConfig.username,
					DBConfig.password)) {
				try (PreparedStatement stmt = connection
						.prepareStatement("INSERT INTO Candidate (id, name, quizHostId, joinedAt, completedAt) VALUES (?, ?, ?, ?, ?)")) {
					stmt.setString(1, candidate.getId());
					stmt.setString(2, candidate.getName());
					stmt.setString(3, candidate.getQuizHost().getId());
					stmt.setString(4, candidate.getJoinedAt());
					stmt.setString(5, candidate.getCompletedAt());
					status = stmt.executeUpdate() == 1 ? true : false;

					try (PreparedStatement answerStmt = connection.prepareStatement(
							"INSERT INTO CandidateSelectedAnswer (id, answerOptionId, questionId, candidateId) VALUES (?, ?, ?, ?)")) {

						Iterator<CandidateQuestionDTO> iterator = candidate.getQuiz().getCondidateQuestionDTOList()
								.iterator();

						while (iterator.hasNext()) {
							CandidateQuestionDTO qsn = iterator.next();
							AnswerDTO selectedAnsOption = qsn.getSelectedAnswerDTO();

							if (selectedAnsOption == null) {
								continue;
							}

							answerStmt.setString(1, UUID.randomUUID().toString());
							answerStmt.setString(2, selectedAnsOption.getId());
							answerStmt.setString(3, qsn.getId());
							answerStmt.setString(4, candidate.getId());
							status = answerStmt.executeUpdate() == 1 ? true : false;
						}
					}
				}
			}
		} catch (SQLException e) {
			System.out.print("SQL Exception is::" + e.getStackTrace());
			status = false;
			return status;

		}
		return status;
	}

	public QuizResults getQuizResults() {
		QuizResults results = new QuizResults();
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return results;
			}

			try (Connection connection = DriverManager.getConnection(DBConfig.url, DBConfig.username,
					DBConfig.password)) {
				try (PreparedStatement stmt = connection.prepareStatement("SELECT * FROM QuizHost")) {
					ResultSet rs = stmt.executeQuery();
					while (rs.next()) {
						String hostId = rs.getString("id");
						String quizId = rs.getString("quizId");
						String hostedAt = rs.getString("hostedAt");
						String hostQuizCode = rs.getString("quizCode");
						String hostQuizStateString = rs.getString("status");
						QuizDTO quiz = this.getQuizDTO(quizId);

						QuizHostDTO quizHost = new QuizHostDTO();

						if (hostQuizCode != null && quizId != null && quiz != null) {
							quizHost.setId(hostId);
							quizHost.setCode(hostQuizCode);
							quizHost.setQuizId(quizId);
							quizHost.setQuizName(quiz.getName());
							quizHost.setHostedAt(hostedAt);
							quizHost.setStatus(QuizHostState.valueOf(hostQuizStateString));

							// Fetch Candidates who joined this quiz Host
							try (PreparedStatement candidateStmt = connection
									.prepareStatement("SELECT * FROM Candidate where quizHostId = ?")) {
								candidateStmt.setString(1, hostId);
								ResultSet candidateRS = candidateStmt.executeQuery();
								ArrayList<ResultCandidate> candidates = new ArrayList<ResultCandidate>();

								while (candidateRS.next()) {
									String candId = candidateRS.getString("id");
									String name = candidateRS.getString("name");
									String joinedAt = candidateRS.getString("joinedAt");
									String completedAt = candidateRS.getString("completedAt");
									String candHostId = candidateRS.getString("quizHostId");
									ResultCandidate candidate = new ResultCandidate(candId, name);
									candidate.setJoinedAt(joinedAt);
									candidate.setCompletedAt(completedAt);
									candidate.setHostId(candHostId);
									
									// Fetch QuestionListAttempted by candidate
									try (PreparedStatement selectedAnswrStmt = connection.prepareStatement(
											"SELECT * FROM CandidateSelectedAnswer where candidateId = ?")) {
										selectedAnswrStmt.setString(1, candId);
										ResultSet selectedAnswrRS = selectedAnswrStmt.executeQuery();
										ArrayList<CandidateQuestionDTO> candQsnList = new ArrayList<CandidateQuestionDTO>();

										while (selectedAnswrRS.next()) {
											String answerOptionId = selectedAnswrRS.getString("answerOptionId");
											String questionId = selectedAnswrRS.getString("questionId");

											// Fetch Question
											try (PreparedStatement qsnStmt = connection
													.prepareStatement("SELECT * FROM Question where id = ?")) {
												qsnStmt.setString(1, questionId);
												ResultSet qsnRS = qsnStmt.executeQuery();

												if (qsnRS.next()) {
													String qsnId = qsnRS.getString("id");
													String qsnTitle = qsnRS.getString("title");
													String qsnQuizId = qsnRS.getString("quizId");
													CandidateQuestionDTO candQsn = new CandidateQuestionDTO();
													candQsn.setId(qsnQuizId);
													candQsn.setTitle(qsnTitle);
													// Fetch Answer Option for the question
													candQsn.setAnswerDTOList(
															getAnswerOptionList(connection, questionId));
													// Fetch Selected Answer Option
													candQsn.setSelectedAnswerDTO(
															getAnswerOption(connection, answerOptionId));
													candQsnList.add(candQsn);
												}
											}
											candidate.setAttemptedQuestionList(candQsnList);
										}
									}

									candidates.add(candidate);
								}
								quizHost.setCandidateList(candidates);
							}

							results.add(quizHost);
						}
					}
				}
			}

		} catch (SQLException e) {
			System.out.print("SQL Exception is::" + e.getStackTrace());
			return results;

		}
		return results;
	}

	public ArrayList<AnswerDTO> getAnswerOptionList(Connection connection, String questionId) throws SQLException {
		ArrayList<AnswerDTO> answerDTOList = new ArrayList<AnswerDTO>();

		try (PreparedStatement ansOptionStmt = connection
				.prepareStatement("SELECT * FROM AnswerOption where questionId = ?")) {
			ansOptionStmt.setString(1, questionId);
			ResultSet ansOptionRS = ansOptionStmt.executeQuery();
			while (ansOptionRS.next()) {
				// id | title | isCorrect | questionId
				String ansOptionId = ansOptionRS.getString("id");
				String ansOptionTitle = ansOptionRS.getString("title");
				boolean ansOptionIsCorrect = ansOptionRS.getBoolean("isCorrect");
				AnswerDTO ansDTO = new AnswerDTO();
				ansDTO.setId(ansOptionId);
				ansDTO.setTitle(ansOptionTitle);
				ansDTO.setCorrect(ansOptionIsCorrect);
				answerDTOList.add(ansDTO);
			}
		}
		return answerDTOList;
	}

	public AnswerDTO getAnswerOption(Connection connection, String answerOptionId) throws SQLException {
		AnswerDTO answerDTO = null;

		try (PreparedStatement ansOptionStmt = connection.prepareStatement("SELECT * FROM AnswerOption where id = ?")) {
			ansOptionStmt.setString(1, answerOptionId);
			ResultSet ansOptionRS = ansOptionStmt.executeQuery();
			if (ansOptionRS.next()) {
				// id | title | isCorrect | questionId
				String ansOptionId = ansOptionRS.getString("id");
				String ansOptionTitle = ansOptionRS.getString("title");
				boolean ansOptionIsCorrect = ansOptionRS.getBoolean("isCorrect");
				answerDTO = new AnswerDTO();
				answerDTO.setId(ansOptionId);
				answerDTO.setTitle(ansOptionTitle);
				answerDTO.setCorrect(ansOptionIsCorrect);
			}
		}
		return answerDTO;
	}
	
	public ResultCandidate getCandidate(String id) {
		ResultCandidate candidate = null;
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return candidate;
			}

			try (Connection connection = DriverManager.getConnection(DBConfig.url, DBConfig.username,
					DBConfig.password)) {
				try (PreparedStatement stmt = connection.prepareStatement("SELECT * FROM Candidate where id = ?")) {
					stmt.setString(1, id);
					ResultSet rs = stmt.executeQuery();
					if (rs.next()) {
						String candId = rs.getString("id");
						String name = rs.getString("name");
						String joinedAt = rs.getString("joinedAt");
						String completedAt = rs.getString("completedAt");
						String candHostId = rs.getString("quizHostId");
						candidate = new ResultCandidate(candId, name);
						candidate.setJoinedAt(joinedAt);
						candidate.setCompletedAt(completedAt);
						candidate.setHostId(candHostId);
						
						// Fetch QuestionListAttempted by candidate
						try (PreparedStatement selectedAnswrStmt = connection.prepareStatement(
								"SELECT * FROM CandidateSelectedAnswer where candidateId = ?")) {
							selectedAnswrStmt.setString(1, candId);
							ResultSet selectedAnswrRS = selectedAnswrStmt.executeQuery();
							ArrayList<CandidateQuestionDTO> candQsnList = new ArrayList<CandidateQuestionDTO>();

							while (selectedAnswrRS.next()) {
								String answerOptionId = selectedAnswrRS.getString("answerOptionId");
								String questionId = selectedAnswrRS.getString("questionId");

								// Fetch Question
								try (PreparedStatement qsnStmt = connection
										.prepareStatement("SELECT * FROM Question where id = ?")) {
									qsnStmt.setString(1, questionId);
									ResultSet qsnRS = qsnStmt.executeQuery();

									if (qsnRS.next()) {
										String qsnId = qsnRS.getString("id");
										String qsnTitle = qsnRS.getString("title");
										String qsnQuizId = qsnRS.getString("quizId");
										CandidateQuestionDTO candQsn = new CandidateQuestionDTO();
										candQsn.setId(qsnQuizId);
										candQsn.setTitle(qsnTitle);
										// Fetch Answer Option for the question
										candQsn.setAnswerDTOList(
												getAnswerOptionList(connection, questionId));
										// Fetch Selected Answer Option
										candQsn.setSelectedAnswerDTO(
												getAnswerOption(connection, answerOptionId));
										candQsnList.add(candQsn);
									}
								}
								candidate.setAttemptedQuestionList(candQsnList);
							}
						}
					}
				}
			}

		} catch (SQLException e) {
			System.out.print("SQL Exception is::" + e.getStackTrace());
			return candidate;

		}
		return candidate;
	}
}
