package membership;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class UploadDAO extends JDBConnect {
	
	public void upload(String lat, String lon, String memo) throws SQLException {
		
		PreparedStatement psmt = null;
		try {
			String sql = "insert into uploaddata set Latitude=?,longitude=?,memo=?";
			psmt = con.prepareStatement(sql);
			BigDecimal Changelat = new BigDecimal(lat);
			BigDecimal Changelon = new BigDecimal(lon);
			psmt.setBigDecimal(1, Changelat);
			psmt.setBigDecimal(2, Changelon);
			psmt.setString(3, memo);			
			psmt.executeUpdate();			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(con != null) con.close();
		}		
	}
		
	public List<UploadDTO> getUpload() {		
		List<UploadDTO> list = new ArrayList<UploadDTO>();
		
		
		String query = "select * from uploaddata";
		
		
		try {
			stmt = con.createStatement();			
			rs = stmt.executeQuery(query);	
			
			while(rs.next()) {
				UploadDTO dto = new UploadDTO();
				dto.setLatitude(rs.getString("Latitude"));
				dto.setLongitude(rs.getString("longitude"));
				dto.setMemo(rs.getString("memo"));
				dto.setDate(rs.getString("regidate"));
				list.add(dto);				
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("회원 조회 실패");
		}
		return list;
	}
}
