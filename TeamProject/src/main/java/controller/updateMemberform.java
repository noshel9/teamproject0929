package controller;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;

import java.util.*;



public class updateMemberform extends HttpServlet {



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		updateMemberAction(request, response);
	}
	
	public void updateMemberAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		
		//Date currentDatetime = new Date(System.currentTimeMillis());
		//java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
		//java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime()); 
		
		MemberDAO dao = new MemberDAO();
		dao.getupdateMemberDTO(id, pass, name,  address);
		
		response.sendRedirect("/TeamProject/Member/resultMember.jsp?msg=0");
		
		//request.getRequestDispatcher("/member/updatgeMember.jsp").forward(request, response);
	}
		
}
