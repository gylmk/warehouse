package com.baidu.entity;

public class Goods extends Store{
	private String id;
	private double amount;
	private String goodname;
	private String nm;
	private String unit;
	private String storeid;
	//////////////////////
	private int    num;
	private String ids;
	private String storename;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getGoodname() {
		return goodname;
	}
	public void setGoodname(String goodname) {
		this.goodname = goodname;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getStoreid() {
		return storeid;
	}
	public void setStoreid(String storeid) {
		this.storeid = storeid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public Goods(String id, String name, String address, String manager, String id2, double amount, String goodname,
			String nm, String unit, String storeid, int num, String ids, String storename) {
		super(id, name, address, manager);
		id = id2;
		this.amount = amount;
		this.goodname = goodname;
		this.nm = nm;
		this.unit = unit;
		this.storeid = storeid;
		this.num = num;
		this.ids = ids;
		this.storename = storename;
	}
	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Goods(String id, String name, String address, String manager) {
		super(id, name, address, manager);
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Goods [id=" + id + ", amount=" + amount + ", goodname=" + goodname + ", nm=" + nm + ", unit=" + unit
				+ ", storeid=" + storeid + ", num=" + num + ", ids=" + ids + ", storename=" + storename + "]";
	}
}
