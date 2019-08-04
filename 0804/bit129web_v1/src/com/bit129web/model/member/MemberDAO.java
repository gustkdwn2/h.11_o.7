package com.bit129web.model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberDAO() {
		try{
			Context init = new InitialContext();
	  	    ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	  		
		}catch(Exception e){
			System.out.println("DB 연결 실패 : " + e);
			return;
		}
	}

	public boolean memberjoinInsert(MemberVO membervo) {

		String SQL = "";
		int result = 0;

		try {
			conn = ds.getConnection();
			SQL = "insert into member values(?, ?, ?, ?, ?)";

			pstmt = conn.prepareStatement(SQL);
			System.out.println(membervo.getMemberID());
			pstmt.setString(1, membervo.getMemberID());
			pstmt.setString(2, membervo.getMemberPWD());
			pstmt.setString(3, membervo.getMemberName());
			pstmt.setString(4, membervo.getMemberEmail());
			pstmt.setString(5, membervo.getMemberPhone());

			result = pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}

		return false;
	}
}
