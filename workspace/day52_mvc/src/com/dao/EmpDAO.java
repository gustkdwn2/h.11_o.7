package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.domain.EmpDTO;

import dbclose.util.CloseUtil;

public class EmpDAO {
	int empno;
	DataSource dataFactory;
	
	public EmpDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc:EmpDB");
			System.out.println("connection success!!");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	// data select
	public ArrayList<EmpDTO> select() {
		
		ArrayList<EmpDTO> list = new ArrayList<EmpDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataFactory.getConnection();
			String sql = "select empno, ename, sal, deptno from emp";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while ( rs.next() ) {
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				int sal = rs.getInt("sal");
				String deptno = rs.getString("deptno");
				
				EmpDTO dto = new EmpDTO(empno, ename, sal, deptno);
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);
			CloseUtil.close(pstmt);
			CloseUtil.close(conn);
		}
		
		return list;
	}
}