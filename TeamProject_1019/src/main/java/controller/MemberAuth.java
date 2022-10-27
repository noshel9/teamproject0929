package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDTO;
import membership.MemberDAO;

@WebServlet("/MemberAuth")
public class MemberAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();	// application 내장 객체 얻어오기		
		dao = new MemberDAO();
	}	
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	//String member_id = this.getInitParameter("member_id");	// 서블릿 초기화 매개변수
    	request.setCharacterEncoding("UTF-8");	
    	String admin_id = this.getInitParameter("admin_id");
    	// 인증 요청한 아이디, 패스워드 확인
    	String id = request.getParameter("id");
    	String pass = request.getParameter("pass");
    	// 회원 테이블에서 요청한 아이디, 패스워드에 해당하는 회원찾기
    	MemberDTO memberDTO = dao.getMemberDTO(id, pass);    	
    	// 찾은 회원 이름 출력, 회원처리
    	String memberName = memberDTO.getName();
    	System.out.println(memberName);
    	if(memberName != null) {
    		request.setAttribute("authMessage", memberName+" 회원님 반갑습니다");
    		
    	}else {
			if(admin_id.equals(id)) { // 관리자
				request.setAttribute("authMessage", admin_id + "는 관리자");
			}else {
				request.setAttribute("authMessage", "귀하는 회원이 아닙니다");
			}
			
		}
    	request.getRequestDispatcher("MemberAuth.jsp").forward(request, response);
    }
    @Override
	public void destroy() {
		dao.close();
	}
}
