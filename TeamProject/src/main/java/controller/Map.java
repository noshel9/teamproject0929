package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import membership.MemberDAO;
import membership.MemberDTO;

public class Map extends HttpServlet {
	private static final long serialVersionUID = 1L;
         
    public Map() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			dataUpload(request, response);
		} catch (ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dataUpload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		MemberDAO dao = new MemberDAO();
		String lat = request.getParameter("lat");
		String lon = request.getParameter("lon");
		String memo = request.getParameter("memo");
		
		dao.upload(lat, lon, memo);
		
		response.sendRedirect("map.jsp");	
		
	}
}
