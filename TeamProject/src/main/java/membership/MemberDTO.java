package membership;

public class MemberDTO {
	private String id;	
	private String pass;
	private String name;
	private String regidate;
	private String tel;
	private String pwfind;	
	
	
	public String getPwfind() {
		return pwfind;
	}
	public void setPwfind(String pwfind) {
		this.pwfind = pwfind;
	}

	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	
	
}
