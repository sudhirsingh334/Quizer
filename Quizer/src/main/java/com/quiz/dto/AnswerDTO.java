package com.quiz.dto;

public class AnswerDTO {
  private String id;
  private  String title;
  private boolean isCorrect;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public boolean isCorrect() {
	return isCorrect;
}
public void setCorrect(boolean isCorrect) {
	this.isCorrect = isCorrect;
}
	

}
