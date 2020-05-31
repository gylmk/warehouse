package com.baidu.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baidu.entity.Goods;
import com.baidu.entity.History;
import com.baidu.entity.Store;
import com.baidu.entity.User;
import com.baidu.service.GoodServiceI;

@Controller
public class GoodController {
	@Autowired
	private GoodServiceI goodService;
	
	//商品的列表
	@RequestMapping(value="goodlist")
	public String goodlist(){
		return "tree/home";
	}
	
	//仓库的列表
	@RequestMapping(value="storeAction_list")
	public String storeAction_list(Model model){
		List<Store> storelist = this.goodService.storeAction_list();
		model.addAttribute("storelist", storelist);
		return "store/list";
	}
	
	//添加仓库
	@RequestMapping(value="storeadd")
	public String storeadd(){
		return "store/add";
	}
	
	//添加仓库信息
	@RequestMapping(value="storeAction_add")
	public String storeAction_add(Store store,HttpServletRequest request){
		int i = this.goodService.storeAction_add(store);
		if (i>0) {
			request.setAttribute("success", "添加仓库成功");
		}else {
			request.setAttribute("error", "添加仓库失败");
		}
		return "redirect:storeAction_list.do";
	}
	
	//去编辑页面
	@RequestMapping(value="toedit")
	public String toedit(String id,Model model){
		 Store store = this.goodService.toedit(id);
		 model.addAttribute("store", store);
		return "store/edit";
	}
	
	//修改仓库
	@RequestMapping(value="storeupdate")
	@ResponseBody
	public boolean storeupdate(Store store){
		int i = this.goodService.storeupdate(store);
		if (i>0) {
			return true;
		}else {
			return false;
		}
	}
	
	//删除仓库
	@RequestMapping(value="stroedelete")
	@ResponseBody
	public boolean stroedelete(String id){
		int i = this.goodService.stroedelete(id);
		if (i>0) {
			return true;
		}else {
			return false;
		}
	}
	
	//查询信息
	@RequestMapping(value="goodsAction_searchUI")
	public String goodsAction_searchUI(Model model,Goods goods){
		//获取简记码
		String nm = goods.getNm();
		//��������
		String goodname = goods.getGoodname();
		//�ֿ�
		String storeid = goods.getStoreid();
		//�жϼ����
		nm=nm==null?"":nm;
		//�жϻ�������
		goodname=goodname==null?"":goodname;
		//�жϲֿ�
		storeid=storeid==null?"":storeid;
		//��ѯ��Ʒ���
		List<Goods> goodslist = this.goodService.goodsAction_searchUI(nm,goodname,storeid);
		model.addAttribute("goodslist", goodslist);
		model.addAttribute("nm", nm);
		model.addAttribute("goodname", goodname);
		model.addAttribute("storeid", storeid);
		return "goods/remain";
	}
	
	//���Բֿ������˵�
	@RequestMapping(value="goodsAction_findAllStore")
	@ResponseBody
	public List<Store> goodsAction_findAllStore(){
		List<Store> storelist = this.goodService.storeAction_list();
		return storelist;
	}
	
	//入库
	@RequestMapping(value="goodsAction_addUI")
	public String goodsAction_addUI(){
		return "goods/save";
	}
	
	//��֤��Ʒ��ƴ�Ƿ����|���һ�ȡ���ݶ���
	@RequestMapping(value="checkByStoreNm")
	@ResponseBody
	public List<Goods> checkByStoreNm(String nm){
		List<Goods> listgoods = this.goodService.checkByStoreNm(nm);
		return listgoods;
	}
	
	//�޸����
	@RequestMapping(value="updategood")
	@ResponseBody
	public boolean updategood(String ids,int num,HttpServletRequest request){
		//�õ��û�
		User user = (User)request.getSession().getAttribute("user");
		int i = this.goodService.updategood(ids,num,user);
		if (i>0) {
			return true;
		}else {
			return false;
		}
	}
	
	//入库添加
	@RequestMapping(value="addgood")
	@ResponseBody
	public boolean addgood(Goods goods,HttpServletRequest request){
		//�õ��û�
		User user = (User) request.getSession().getAttribute("user");
		int i = this.goodService.addgood(goods,user);
		if (i>0) {
			return true;
		}else {
			return false;
		}
	}
	
	//ȥ����ҳ��
	@RequestMapping(value="goodsAction_outUI")
	public String goodsAction_outUI(){
		return "goods/out";
	}
	
	//模糊查询
	@RequestMapping(value="goodsAction_findLinkByName")
	@ResponseBody
	public List<Goods> goodsAction_findLinkByName(String name){
		//List<String> list = new ArrayList<String>();
		List<Goods> goodlist = this.goodService.goodsAction_findLinkByName(name);
		/*for (Goods goods : goodlist) {
			list.add(goods.getGoodname());
		}*/
		return goodlist;
	}
	
	//根据商品名称查询商品信息
	@RequestMapping(value="goodsAction_findGoodsByName")
	@ResponseBody
	public Goods goodsAction_findGoodsByName(String name){
		Goods goods = this.goodService.goodsAction_findGoodsByName(name);
		return goods;
	}
	
	//删除商品信息
	@RequestMapping(value="deleteGood")
	@ResponseBody
	public boolean deleteGood(String id,double number,HttpServletRequest request){
		//��ȡ�û�
		User user = (User)request.getSession().getAttribute("user");
		int i = this.goodService.deleteGood(id,number,user);
		if (i>0) {
			return true;
		}else {
			return false;
		}
	}
	
	//修改商品信息
	@RequestMapping(value="updateGood")
	@ResponseBody
	public boolean updateGood(String id,double num,double number,HttpServletRequest request){
		//获取session中用户信息
		User user = (User)request.getSession().getAttribute("user");
		int i = this.goodService.updateGood(id,num,number,user);
		if (i>0) {
			return true;
		}else {
			return false;
		}
	}
	
	//获取历史记录
	@RequestMapping(value="historyAction_toHistory")
	public String historyAction_toHistory(Model model,HttpServletRequest request){
		List<History> listhistory = this.goodService.historyAction_toHistory();
		request.getSession().getAttribute("user");
		model.addAttribute("listhistory", listhistory);
		return "his/his";
	}
}