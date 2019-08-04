package com.bit129web.model.board;

import java.sql.Date;

public class BoardVO {
	private int boardNum;
	private String boardTitle;
	private String contnent;
	private int boardPresent; // 현황
	private Date boardDate;
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getContnent() {
		return contnent;
	}
	public void setContnent(String contnent) {
		this.contnent = contnent;
	}
	public int getBoardPresent() {
		return boardPresent;
	}
	public void setBoardPresent(int boardPresent) {
		this.boardPresent = boardPresent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	
	
}
