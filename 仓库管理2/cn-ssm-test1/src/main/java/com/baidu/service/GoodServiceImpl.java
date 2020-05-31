package com.baidu.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baidu.entity.Goods;
import com.baidu.entity.History;
import com.baidu.entity.Store;
import com.baidu.entity.User;
import com.baidu.mapper.GoodMapperI;
import com.baidu.mapper.HistoryMapperI;

@Service
public class GoodServiceImpl implements GoodServiceI{
	@Autowired
	private GoodMapperI goodMapper;
	@Autowired
	private HistoryMapperI hm;
	
	@Override
	public List<Store> storeAction_list() {
		List<Store> storelist = this.goodMapper.storeAction_list();
		return storelist;
	}

	@Override
	public int storeAction_add(Store store) {
		String id = UUID.randomUUID().toString();
		store.setId(id);
		int i = this.goodMapper.storeAction_add(store);
		return i;
	}

	@Override
	public Store toedit(String id) {
		Store store = this.goodMapper.toedit(id);
		return store;
	}

	@Override
	public int storeupdate(Store store) {
		int i = this.goodMapper.storeupdate(store);
		return i;
	}

	@Override
	public int stroedelete(String id) {
		int i = this.goodMapper.stroedelete(id);
		return i;
	}

	@Override
	public List<Goods> goodsAction_searchUI(String nm, String goodname, String storeid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nm", nm);
		map.put("goodname", goodname);
		map.put("storeid", storeid);
		List<Goods> goodslist = this.goodMapper.goodsAction_searchUI(map);
		return goodslist;
	}

	@Override
	public List<Goods> checkByStoreNm(String nm) {
		List<Goods> listgoods = this.goodMapper.checkByStoreNm(nm);
		return listgoods;
	}
	
	/**
	 * 入库商品
	 */
	@Override
	public int addgood(Goods goods,User user) {
		//获取随机数
		String id = UUID.randomUUID().toString();
		goods.setId(id);
		//执行添加商品信息
		int i = this.goodMapper.addgood(goods);
		
		//获取随机数
		String uuid = UUID.randomUUID().toString(); 
		//获取商品数量
		double num = goods.getAmount();
		//实例化历史记录对象
		History history = new History();
		history.setId(uuid);
		history.setAmounts(num);
		history.setRemain(num);
		history.setHistoryid(id);
		history.setUser(user.getUsername());
		//执行数据库中历史记录的添加
		hm.insertHistory(history);
		return i;
	}
	
	/**
	 * 入库
	 */
	@Override
	public int updategood(String ids, int num,User user) {
		double amount = this.goodMapper.getAmounts(ids);
		//总的商品数量
		double amount2 = amount+num;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ids", ids);
		map.put("amount2", amount2);
		//执行修改
		int i = this.goodMapper.updategood(map); 
		
		
		//获取随机数
		String uuid = UUID.randomUUID().toString(); 
		//实例化历史记录
		History history = new History();
		history.setId(uuid);
		history.setAmounts(num);
		history.setRemain(amount2);
		history.setHistoryid(ids);
		history.setUser(user.getUsername());
		hm.insertHistory(history);
		return i;
	}

	@Override
	public List<Goods> goodsAction_findLinkByName(String name) {
		List<Goods> goodlist = this.goodMapper.goodsAction_findLinkByName(name);
		return goodlist;
	}

	@Override
	public Goods goodsAction_findGoodsByName(String name) {
		Goods goods = this.goodMapper.goodsAction_findGoodsByName(name);
		return goods;
	}

	@Override
	public int deleteGood(String id,double number,User user) {
		//������Ʒ��id��ѯ����ʷ��¼��historyid
		String historyid = id;
		//������Ʒidɾ����Ʒ
		int i = this.goodMapper.deleteGood(id);
		//ɾ����ʷ��¼
		if (i>0) {
			hm.deleteHistory(historyid);
		}
		/*//��ʷ��¼��id 
		String uuid = UUID.randomUUID().toString(); 
		//��ʷ���з�ֵ(��������==�����)
		History history = new History();
		history.setId(uuid);
		history.setAmounts(number);
		history.setRemain(0);
		history.setHistoryid(id);
		history.setUser(user.getUsername());
		hm.updateHistory(history);*/	
		return i;
	}

	@Override
	public int updateGood(String id,double num,double number,User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("num", number-num);
		//执行数据库商品数量的修改
		int i = this.goodMapper.updateGood(map);
		
		//产生随机数
		String uuid = UUID.randomUUID().toString(); 
		//实例化历史记录对象
		History history = new History();
		history.setId(uuid);
		history.setAmounts(num);
		history.setRemain(number-num);
		history.setHistoryid(id);
		history.setUser(user.getUsername());
		//向数据库中插入历史记录信息
		hm.updateHistory(history);
		return i;
	}

	@Override
	public List<History> historyAction_toHistory() {
		List<History> listhistory = hm.listhistory();
		return listhistory;
	}
}
