package com.baidu.entity;

public class History {
	private String id;
	private double amounts;
	private String datetime;
	private double remain;
	private String type;
	private String user;
	private String historyid; 
	////////////////////////
	private String storenames;
	private String nm;
	private String goodname;
	private String unit;
	private double amount;
	private String name;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getAmounts() {
		return amounts;
	}
	public void setAmounts(double amounts) {
		this.amounts = amounts;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public double getRemain() {
		return remain;
	}
	public void setRemain(double remain) {
		this.remain = remain;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getHistoryid() {
		return historyid;
	}
	public void setHistoryid(String historyid) {
		this.historyid = historyid;
	}
	public String getStorenames() {
		return storenames;
	}
	public void setStorenames(String storenames) {
		this.storenames = storenames;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getGoodname() {
		return goodname;
	}
	public void setGoodname(String goodname) {
		this.goodname = goodname;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public History(String id, double amounts, String datetime, double remain, String type, String user,
			String historyid, String storenames, String nm, String goodname, String unit, double amount, String name) {
		super();
		this.id = id;
		this.amounts = amounts;
		this.datetime = datetime;
		this.remain = remain;
		this.type = type;
		this.user = user;
		this.historyid = historyid;
		this.storenames = storenames;
		this.nm = nm;
		this.goodname = goodname;
		this.unit = unit;
		this.amount = amount;
		this.name = name;
	}
	public History() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "History [id=" + id + ", amounts=" + amounts + ", datetime=" + datetime + ", remain=" + remain
				+ ", type=" + type + ", user=" + user + ", historyid=" + historyid + ", storenames=" + storenames
				+ ", nm=" + nm + ", goodname=" + goodname + ", unit=" + unit + ", amount=" + amount + ", name=" + name
				+ "]";
	}
}
