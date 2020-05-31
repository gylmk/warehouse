package com.baidu.mapper;

import java.util.List;
import java.util.Map;

import com.baidu.entity.Goods;
import com.baidu.entity.Store;

public interface GoodMapperI {

	List<Store> storeAction_list();

	int storeAction_add(Store store);

	Store toedit(String id);

	int storeupdate(Store store);

	int stroedelete(String id);

	List<Goods> goodsAction_searchUI(Map<String, Object> map);

	List<Goods> checkByStoreNm(String nm);

	int updategood(Map<String, Object> map);

	int addgood(Goods goods);

	double getAmounts(String ids);

	List<Goods> goodsAction_findLinkByName(String name);

	Goods goodsAction_findGoodsByName(String name);

	int deleteGood(String id);

	int updateGood(Map<String, Object> map);

}
