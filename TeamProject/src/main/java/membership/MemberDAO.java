package membership;

import java.math.BigDecimal;
import java.security.spec.RSAKeyGenParameterSpec;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

//import javax.servlet.ServletContext;

import common.JDBConnect;
//import controller.Statement;

public class MemberDAO extends JDBConnect{
	
	private ArrayList<MemberDTO> list;

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
				dto.setPwfind(rs.getString("pwfind"));
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
			 String address, String pwfind){
		
		MemberDTO dto = new MemberDTO(); 
		
		String query = "insert into member set id=?,pass=?,name=?,address=?,pwfind=?";
		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			psmt.setString(3, name);
			psmt.setString(4, address);
			psmt.setString(5, pwfind);
			//psmt.setTimestamp(5, timestamp);			
			
			psmt.executeUpdate();
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return dto;
	}

	public MemberDTO getupdateMemberDTO(String uid, String upass, String name,  String address, String pwfind) {
		MemberDTO dto = new MemberDTO();
		
		String query = "update member set pass=?, name=?, address=?, pwfind=?" 
		+ "where id=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, upass);
			psmt.setString(2, name);
			psmt.setString(3, address);
			psmt.setString(4, pwfind);
			psmt.setString(5, uid);
			
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
	
	public List<MemberDTO> getpwfindDTO(String uid, String pwfind) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();		
		
		String qurey = "select pass from member where id=? and pwfind=?";
		//System.out.println(uid+":"+pwfind);
		try {
			psmt = con.prepareStatement(qurey);
			psmt.setString(1, uid);
			psmt.setString(2, pwfind);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setPass(rs.getString("pass"));
				
				list.add(dto);
				//System.out.println(list);
				
		}
	}catch (Exception e) {
		e.printStackTrace();
	}
		//System.out.println(uid+":"+pwfind);
	return list;

}
}
