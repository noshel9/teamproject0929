package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import membership.*;

@WebServlet("*.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
			Logout(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		request.setCharacterEncoding("UTF-8");		
		String idfind =  request.getParameter("idfind"); // 비밀번호 찾기
		String pwfind = request.getParameter("pwfind");
		
		String userId = request.getParameter("user_id");	// 로그인
		String userPwd = request.getParameter("user_pw");		
		
		if(userId != null && userPwd !=null) {
			userLogin(request, response);			
		}
		if(idfind !=null && pwfind != null) {
			pwfind(request, response);			
		}

	}
	protected void userLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = request.getParameter("user_id");
		String userPwd = request.getParameter("user_pw");		
		request.setAttribute("redi", "f5");
		
		MemberDAO Mdao = new MemberDAO();
		MemberDTO Mdto = Mdao.getMemberDTO(userId, userPwd);	
		//System.out.println(Mdto.getId());
		if(Mdto.getId() != null && !Mdto.getId().equals("")){
			session.setAttribute("UserId", Mdto.getId());
			session.setAttribute("UserName", Mdto.getName());			
			
			//request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
			response.sendRedirect("LoginForm.jsp");
			
		}else{
			request.setAttribute("LoginErrMsg", "로그인오류");		
			request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
			//response.sendRedirect("LoginForm.jsp");
			//System.out.println(session.getAttribute("UserId"));
		}
		Mdao.close();
	}
	
	protected Vector<String> pwfind(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		request.setCharacterEncoding("UTF-8");		
		String idfind =  request.getParameter("idfind");
		String pwfind = request.getParameter("pwfind");
		
		Vector<String> arr = new Vector<>();

		String id = "1";
		String pw = "1";
		if(idfind != null && pwfind != null){
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getMemberPw(idfind, pwfind);	
			id = dto.getId();
			pw = dto.getPass();			
			request.setAttribute("pwchk", "1");
		}
		arr.add(id);
		arr.add(pw);		
		
		request.setAttribute("id", id);
		request.setAttribute("pw", pw);
		//System.out.println(request.getAttribute("id"));
		request.setAttribute("LoginErrMsg", "로그인오류");		
		request.getRequestDispatcher("PwFindChk.jsp").forward(request, response);		
		//response.sendRedirect("LoginForm.jsp");
		return arr;
	}
	
	protected void Logout(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		HttpSession session = request.getSession(); 
		String logout = request.getParameter("Logout");	

		if(logout.equals("2")) {
			session.invalidate();
			response.sendRedirect("../LoginForm.jsp");
		}else if(logout.equals("1")){
			session.invalidate();
			response.sendRedirect("LoginForm.jsp");	
		}
		
	}
	
	
}

