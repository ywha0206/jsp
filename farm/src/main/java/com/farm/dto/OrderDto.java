package com.farm.dto;

public class OrderDto {
	private int orderNo;
	private String uid;
	private int prodId;
	private int Price;
	private int quantity;
	private int delivery;
	private int totalAmount;
	private int usedPoint;
	
	private int payAmount;
	private String orderDate;
	
	//추가
	
	private int payment;
	private String receiver;
	private String receiverHp;
	private String zip;
	private String addr1;
	private String addr2;
	private String etc;
	
	
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getReceiverHp() {
		return receiverHp;
	}
	public void setReceiverHp(String receiverHp) {
		this.receiverHp = receiverHp;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	
	
	
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getProdId() {
		return prodId;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int Price) {
		this.Price = Price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}
	public int getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
	public void setProdId(String parameter) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public String toString() {
		return "OrderDto [orderNo=" + orderNo + ", uid=" + uid + ", prodId=" + prodId + ", prodPrice=" + Price
				+ ", quantity=" + quantity + ", delivery=" + delivery + ", totalAmount=" + totalAmount + ", usedPoint="
				+ usedPoint + ", payAmount=" + payAmount + ", orderDate=" + orderDate + ", payment=" + payment
				+ ", receiver=" + receiver + ", receiverHp=" + receiverHp + ", zip=" + zip + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", etc=" + etc + "]";
	}
	
	
	
}
