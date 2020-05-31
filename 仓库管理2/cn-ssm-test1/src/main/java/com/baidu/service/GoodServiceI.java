package com.baidu.service;

import java.util.List;
import com.baidu.entity.Goods;
import com.baidu.entity.History;
import com.baidu.entity.Store;
import com.baidu.entity.User;

public interface GoodServiceI {

	List<Store> storeAction_list();

	int storeAction_add(Store store);

	Store toedit(String id);

	int storeupdate(Store store);

	int stroedelete(String id);

	List<Goods> goodsAction_searchUI(String nm, String goodname, String storeid);

	List<Goods> checkByStoreNm(String nm);

	int updategood(String ids, int num, User user);

	int addgood(Goods goods, User user);

	List<Goods> goodsAction_findLinkByName(String name);

	Goods goodsAction_findGoodsByName(String name);

	int deleteGood(String id, double number, User user);

	int updateGood(String id, double num, double number, User user);

	List<History> historyAction_toHistory();
}
