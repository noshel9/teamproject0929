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
		ServletContext application = this.getServletContext();	// application ���� ��ü ������		
		dao = new MemberDAO();
	}	
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	//String member_id = this.getInitParameter("member_id");	// ���� �ʱ�ȭ �Ű�����
    	request.setCharacterEncoding("UTF-8");	
    	String admin_id = this.getInitParameter("admin_id");
    	// ���� ��û�� ���̵�, �н����� Ȯ��
    	String id = request.getParameter("id");
    	String pass = request.getParameter("pass");
    	// ȸ�� ���̺��� ��û�� ���̵�, �н����忡 �ش��ϴ� ȸ��ã��
    	MemberDTO memberDTO = dao.getMemberDTO(id, pass);    	
    	// ã�� ȸ�� �̸� ���, ȸ��ó��
    	String memberName = memberDTO.getName();
    	System.out.println(memberName);
    	if(memberName != null) {
    		request.setAttribute("authMessage", memberName+" ȸ���� �ݰ����ϴ�");
    		
    	}else {
			if(admin_id.equals(id)) { // ������
				request.setAttribute("authMessage", admin_id + "�� ������");
			}else {
				request.setAttribute("authMessage", "���ϴ� ȸ���� �ƴմϴ�");
			}
			
		}
    	request.getRequestDispatcher("MemberAuth.jsp").forward(request, response);
    }
    @Override
	public void destroy() {
		dao.close();
	}
}
