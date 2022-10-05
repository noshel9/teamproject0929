package membership;

import java.sql.PreparedStatement;
import java.sql.SQLException;

//import javax.servlet.ServletContext;

import common.JDBConnect;
//import controller.Statement;

public class MemberDAO extends JDBConnect{
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();	
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRegidate(rs.getString("regidate"));
				dto.setTel(rs.getString("tel"));
				dto.setPwfind(rs.getString("pwfind"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("회원 조회 실패");
		}
		
		return dto;
	}
	public int getMemberID(String uid) {
		int cnt =0;
		String query = "select * from member where id=? ";
		String id;
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);			
			rs = psmt.executeQuery();	
			
			if(rs.next()) {
				id = rs.getString("id");
				cnt++;				
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("회원 조회 실패");
		}
		
		return cnt;
	}
	
	public MemberDTO getMemberPw(String id, String pwfind) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pwfind=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pwfind);
			rs = psmt.executeQuery();	
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRegidate(rs.getString(4));				
				dto.setTel(rs.getString("tel"));
				dto.setPwfind(rs.getString("pwfind"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("회원 조회 실패");
		}
		
		return dto;
	}
	
	public MemberDTO getMemberDTO_id(String id) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);			
			rs = psmt.executeQuery();	
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRegidate(rs.getString(4));				
				dto.setTel(rs.getString("tel"));
				dto.setPwfind(rs.getString("pwfind"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("회원 조회 실패");
		}
		
		return dto;
	}
	
	public void setMemberDTO(MemberDTO dto) {
		//MemberDTO dto = new MemberDTO();
		String query = "insert into member set id=?, pass=?, name=?, age=?, addr=?, tel=?, pwfind=?";		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());			
			psmt.setString(6, dto.getTel());
			psmt.setString(7, dto.getPwfind());
			psmt.executeUpdate();			
			
		} catch (Exception e) {
			System.out.println("회원가입 실패");
			e.printStackTrace();
		}
	}
	
	public void updateMember(String pw, String tel, String pwfind, String id) {
		PreparedStatement psmt = null;
		try{
			String sql = "update member set pass=?,tel=?,pwfind=? where id=?";
						
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1,pw);		
			psmt.setString(2,tel);
			psmt.setString(3,pwfind);
			psmt.setString(4,id);
			
			int r = psmt.executeUpdate();			
		}
		catch(Exception se){				
			System.out.println(se.getMessage());
		}
	}
	
	public void deleteMember(String id_chk) throws SQLException {
		System.out.println(id_chk);
		String sql = "delete from member where id='"+id_chk+"'";
		stmt = con.createStatement();
		int result = stmt.executeUpdate(sql);
		if(con != null) con.close(); 
	}


}
