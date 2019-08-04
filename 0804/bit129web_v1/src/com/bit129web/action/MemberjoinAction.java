package com.bit129web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit129web.model.member.MemberDAO;
import com.bit129web.model.member.MemberVO;

public class MemberjoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		MemberDAO memberdao = new MemberDAO();
		MemberVO membervo = new MemberVO();
		ActionForward forward = new ActionForward();

		boolean result = false;

		try {
			System.out.println(request.getParameter("memberjoin_id"));
			membervo.setMemberID(request.getParameter("memberjoin_id"));
			membervo.setMemberPWD(request.getParameter("memberjoin_pwd"));
			membervo.setMemberName(request.getParameter("memberjoin_name"));
			membervo.setMemberEmail(request.getParameter("memberjoin_email"));
			membervo.setMemberPhone(request.getParameter("memberjoin_phone"));
			result = memberdao.memberjoinInsert(membervo);

			if (result == false) {
				System.out.println("회원가입 실패");
				return null;
			}

			System.out.println("회원가입 완료");
			forward.setRedirect(true);
			forward.setPath("./main.jsp");
			return forward;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
