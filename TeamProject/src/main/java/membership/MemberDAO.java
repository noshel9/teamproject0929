package membership;

import java.math.BigDecimal;
import java.security.spec.RSAKeyGenParameterSpec;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

//import javax.servlet.ServletContext;

import common.JDBConnect;
//import controller.Statement;

public class MemberDAO extends JDBConnect{
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,  uid);
			psmt.setString(2,  upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setAddress(rs.getString("address"));
				dto.setRegidate(rs.getString(4));
				
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
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
			System.out.println("ȸ�� ��ȸ ����");
		}
		
		return cnt;
	}

//	
	public MemberDTO getaddMemberDTO(String uid, String upass, String name,  
			 String address){
		
		MemberDTO dto = new MemberDTO(); 
		
		String query = "insert into member set id=?,pass =?,name=?,address=?";
		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			psmt.setString(3, name);
			psmt.setString(4, address);
			//psmt.setTimestamp(5, timestamp);			
			
			psmt.executeUpdate();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return dto;
	}

	public MemberDTO getupdateMemberDTO(String uid, String upass, String name,  String address) {
		MemberDTO dto = new MemberDTO();
		
		String query = "update member set pass=?, name=?, address=?" 
		+ "where id=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, upass);
			psmt.setString(2, name);
			psmt.setString(3, address);
			psmt.setString(4, uid);
			
			psmt.executeUpdate();
		}
		
		catch(Exception ex) {
			ex.printStackTrace();
		
		}
		return dto;
	}
	
	public MemberDTO getDeleteMemberDTO(String uid) {
		
		MemberDTO dto = new MemberDTO(); 
		
		String query = "delete from member where id=?";
		
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, uid);
			
			psmt.executeUpdate();
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return dto;
	}
	

}
