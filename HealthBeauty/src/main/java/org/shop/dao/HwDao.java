package org.shop.dao;

import java.util.List;

import org.shop.pojo.Hw;

public interface HwDao {
	List  sp(Hw hw);
	int   spxj(Hw hw);
	int  xjrk(Hw hw);
	Hw  dy(int id);
	int ckkk(Hw hw);
	Hw dys(String name);
	
}
