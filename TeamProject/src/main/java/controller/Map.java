package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import membership.UploadDAO;
import membership.UploadDTO;

public class Map extends HttpServlet {
	private static final long serialVersionUID = 1L;
         
    public Map() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(request.getParameter("outputmap") != null) {
		try {
			dataUpdate(request, response);
		} catch (ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(request.getParameter("inputmap") != null) {
		try {
			dataUpload(request, response);
		} catch (ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
	}
	
	public void dataUpload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		UploadDAO dao = new UploadDAO();
		String lat = request.getParameter("lat");
		String lon = request.getParameter("lon");
		String memo = request.getParameter("memo");
		
		dao.upload(lat, lon, memo);
		
		response.sendRedirect("map.jsp");	
		dao.close();
	}
	
	public void dataUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		UploadDAO dao = new UploadDAO();
		
		List<UploadDTO> arr =dao.getUpload();		
		//arr = dao.getUpload();
		Gson gson = new Gson();
		String listJson = gson.toJson(arr).toString();
		System.out.println(listJson);
		request.setAttribute("UploadDTO", listJson);
		request.getRequestDispatcher("outputMap.jsp").forward(request, response);
		dao.close();
	}
}
