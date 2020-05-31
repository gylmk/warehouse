package com.baidu.entity;

public class Store {
	private String id;
	private String  name;
	private String  address;
	private String  manager;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public Store(String id, String name, String address, String manager) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.manager = manager;
	}
	public Store() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Store [id=" + id + ", name=" + name + ", address=" + address + ", manager=" + manager + "]";
	}
}
