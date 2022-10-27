package controller;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

import java.util.*;
import com.mysql.cj.Session;

import membership.*;

//@WebServlet("/control/loginform.do")
public class loginform extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//
//    public loginform() {
//        super();
//        
//    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
//		loginAction.getRequestDispatcher("/member.loginMeber.jsp").forward(request, response);
		loginAction(request, response);
		
	}
	

	public void loginAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession(); 
		request.setCharacterEncoding("UTF-8");
		
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
	
		
		MemberDAO dao = new MemberDAO();
		MemberDTO memberDTO = dao.getMemberDTO(id, pass);
		
		session.setAttribute("UserId", memberDTO.getId());
		
		
		response.sendRedirect("/TeamProject/Member/resultMember.jsp?msg=2");
		
		//request.getRequestDispatcher("/member/loginMember.jsp").forward(request, response);
		
		dao.close();
		
		
	}
	
	

}
