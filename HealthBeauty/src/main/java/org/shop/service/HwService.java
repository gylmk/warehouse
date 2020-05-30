package org.shop.service;

import java.util.List;

import org.shop.pojo.Hw;

public interface HwService {
	List  sp(Hw hw);
	int   spxj(Hw hw);
	int  xjrk(Hw hw);
	Hw  dy(int id);
	int ckkk(Hw hw);
	Hw dys(String name);
}
