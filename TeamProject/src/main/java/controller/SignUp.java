package controller;

import java.io.IOException;
//import java.util.Vector;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import membership.*;

@WebServlet("*.up")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	if(request.getParameter("memberChk") != null) updateMemberChk(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); 
		if( request.getParameter("signUp")!= null) {
			signUp(request, response);
		}
		
		if(request.getParameter("memberChk") != null) updateMemberChk(request, response);
		
		if(request.getParameter("memberUpdate") != null) updateMember(request, response);
		
		if(request.getParameter("deleteMember") !=null)
			try {
				deleteMember(request, response);
			} catch (ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}	
	
	protected void signUp(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		String pwfind = request.getParameter("pwfind");
		int chk = 0;
		MemberDAO Mdao = new MemberDAO();
		MemberDTO Mdto = new MemberDTO();	
		chk = Mdao.getMemberID(id);
		if(chk>0){
			response.sendRedirect("SignUp.jsp?idchk=1&id="+id);
		}else{
			if(!pw.equals("")){
				if(Mdto.getId() != null){
					request.setAttribute("LoginErrMsg", "회원가입실패");
					request.getRequestDispatcher("LoginForm.jsp").forward(request, response);					
				}
				else{	
					Mdto.setId(id);
					Mdto.setPass(pw);
					Mdto.setName(name);					
					Mdto.setTel(tel);
					Mdto.setPwfind(pwfind);
					Mdao.setMemberDTO(Mdto);	
					response.sendRedirect("LoginForm.jsp");	
			}
		}else{
			response.sendRedirect("SignUp.jsp?idchk=0&id="+id);
		}
	}			
	Mdao.close();
	}
	public void updateMemberChk(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		HttpSession session = request.getSession();
		
		String id_chk = request.getParameter("id");
		String pw_chk = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberDTO(id_chk, pw_chk);	
		
		String id = session.getAttribute("UserId").toString();
		String pw = dto.getPass();
		
		request.setAttribute("id", id);
		request.setAttribute("pw", pw);
		
		request.getRequestDispatcher("UpdateMember.jsp").forward(request, response);
	}
	public void updateMember(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		String id = session.getAttribute("UserId").toString();
		String pw = request.getParameter("pw");
		
		String tel = request.getParameter("tel");
		String pwfind = request.getParameter("pwfind");
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(tel);
		System.out.println(pwfind);
		
		MemberDAO dao = new MemberDAO();
		dao.updateMember(pw, tel, pwfind, id);
		dao.close();
		response.sendRedirect("LoginForm.jsp");
	}
	
	public void deleteMember(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException  {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String id_chk = session.getAttribute("UserId").toString();
		String pw_chk = null;

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberDTO_id(id);
		pw_chk = dto.getPass();
		
		request.setAttribute("id", id);
		request.setAttribute("id_chk", id_chk);
		request.setAttribute("pw", pw);
		request.setAttribute("pw_chk", pw_chk);
		
		if(id.equals(id_chk) && pw.equals(pw_chk)){			
			dao.deleteMember(id_chk);
			session.invalidate();
			response.sendRedirect("LoginForm.jsp");
		}else{
			request.getRequestDispatcher("DeleteMember.jsp").forward(request, response);
		}
	}
}

