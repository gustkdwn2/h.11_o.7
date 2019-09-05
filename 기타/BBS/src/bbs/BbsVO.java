package bbs;

import java.sql.Timestamp;

public class BbsVO {
	private int bbsID, bbsAvailable;
	private String bbsTitle, userID, bbsContent;
	private Timestamp bbsDate;
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public Timestamp getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(Timestamp bbsDate) {
		this.bbsDate = bbsDate;
	}
	
}
