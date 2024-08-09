package bank;

public class CustomerVO {
	private String no;
	private String name;
	private int dist;
	private String phone;
	private String addr;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDist() {
		return dist;
	}
	public void setDist(int dist) {
		this.dist = dist;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	@Override
	public String toString() {
		return "CustomerVO [no=" + no + ", name=" + name + ", dist=" + dist + ", phone=" + phone + ", addr=" + addr
				+ "]";
	}
	
}
