package org.shop.controller.user;

import java.io.Reader;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.shop.pojo.Hw;
import org.shop.pojo.Sh;
import org.shop.pojo.User;

import org.shop.service.*;
import org.shop.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user/")
public class UserController {

	@Autowired
	private UserService u;

	@Autowired
	private HwService h;

	@Autowired
	private ShService s;

	// 到login登录页面
	@RequestMapping("tzlogin")
	public String tzlogin(HttpSession session) {
		session.removeAttribute("users");
		return "login";
	}
	// 登录验证
	@ResponseBody
	@RequestMapping("login")
	public String login(User user, HttpSession session, String requestDate) {
		//System.out.println(user.getName());
		Map map = new HashMap();
		//转换格式为map形式
		JSONObject requestJson = JSONObject.fromObject(requestDate);
		map.put("name", requestJson.getString("name"));
		map.put("password", requestJson.getString("password"));
		user.setName(requestJson.getString("name"));
		user.setPassword(requestJson.getString("password"));
		//System.out.println(user.getPassword());
		//对输入密码进行加密
		String password2=user.getPassword();
		MD5Utils  md=new MD5Utils();
	    String a=md.md5(password2);
	    user.setPassword(a);		
		//System.out.println(user.getPassword());
		//用加密后的密码进行查询
		User user2 = u.login(user);
		session.setAttribute("t2", user2.getT2());
		session.setAttribute("id", user2.getId());
		//查不到数据登录失败
		if (user2 == null) {
			Map reMap = new HashMap();
			reMap.put("succ", "false");
			JSONObject jsonObject = JSONObject.fromObject(reMap);
			return jsonObject.toString();
		} else {
			//查到数据登录成功
			//System.out.println("user2" + user2);
			session.setAttribute("name", user.getName());
			session.setAttribute("id", user2.getId());
			session.setAttribute("t1", user2.getT1());
			Map reMap = new HashMap();
			reMap.put("succ", "true");
			session.setAttribute("users", user.getName());
			JSONObject jsonObject = JSONObject.fromObject(reMap);
			return jsonObject.toString();
		}
	}
	//校验用户是否已经存在
	@ResponseBody
	@RequestMapping("byname")
	public String byname(String name) {
		//System.out.println(name);
		User byname = u.byname(name);
		//System.out.println("asdfghjkl+++++++======");
		//System.out.println(byname);
		if(name==""||name==null) {
			return "na";
		}else
		if(byname==null) {
			return "no";
		}else {
			return "yes";
		}
	}
	
     //登录
	//判断不同的数字，根据不同的权限，跳转不同的页面，完成权限登录
	@RequestMapping("sy")
	public String denglu(HttpSession session, String t2, Model model, String name, User user) {
		int qx = (int) session.getAttribute("t1");
		// model.addAttribute("list", u.findall());
		if (qx == 0) {
			model.addAttribute("list", u.findall(user));
			return "gly/yh";
		} else if (qx == 1) {
			model.addAttribute("list", u.findall(user));
			return "gly/yh";
		} else if (qx == 2) {
			return "redirect:tzckxs";
		} else if (qx == 3) {
			return "redirect:tzkccg";
		}
		return "login";
	}
	
    //首页注册方法
	//@ResponseBody	
	@RequestMapping("touser")
	public String touser(User user) throws ParseException {
		//System.out.println("首页注册=====");
		//System.out.println(user);
		//对密码进行加密
		String password2=user.getPassword();
		MD5Utils  md=new MD5Utils();
	    String a=md.md5(password2);
	    user.setPassword(a);
	    //System.out.println(a);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = df.format(System.currentTimeMillis());
		user.setDate(df.parse(time));
		user.setT1(4);
		user.setT2(0);
		//System.out.println(user);
		u.touser(user);
		return "redirect:tzlogin";
	}
    //删除用户
	@RequestMapping("delete")
	public String delete(int id) {
		u.delete(id);
		return "redirect:sy";
	}
    //进入添加用户页面
	@RequestMapping("tjyh")
	public String tzyh() {
		return "gly/upyh";
	}
     //添加用户
	@RequestMapping("insert")
	public String insert(User user) throws ParseException {
		String password2=user.getPassword();
		MD5Utils  md=new MD5Utils();
	    String a=md.md5(password2);
	    user.setPassword(a);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = df.format(System.currentTimeMillis());
		user.setDate(df.parse(time));
		u.touser(user);
		return "redirect:sy";
	}
    //查询
	@RequestMapping("tzup")
	public String tzup(int id, Model mode) {
		User user = u.findid(id);
		mode.addAttribute("user", user);
		return "gly/user";
	}
	//查询
	@RequestMapping("tzzup")
	public String tzzup(Model model,HttpSession session) {
		int  id=(int) session.getAttribute("id");
		User user = u.findid(id);
		model.addAttribute("user", user);
		return "gly/user";
	}
    //更新用户
	@RequestMapping("upyh")
	public String upyh(User user) throws ParseException {
		//密码加密
//		String password2=user.getPassword();
//		MD5Utils  md=new MD5Utils();
//	    String a=md.md5(password2);
//	    user.setPassword(a);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = df.format(System.currentTimeMillis());
		user.setDate(df.parse(time));
		//System.out.println(df.parse(time));
		u.userup(user);
		return "redirect:sy";
	}
   //添加货物
	@RequestMapping("tzhw")
	public String tzhw(Model model, Hw hw) {
		hw.setSj(1);
		hw.setSh(1);
		model.addAttribute("list", h.sp(hw));
		return "gly/hw";
	}
    //货物添加
	@RequestMapping("xj")
	public String spxj(int id, Hw hw) throws ParseException {
		hw.setSh(1);
		hw.setSj(0);
		hw.setId(id);
		//生成当前时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = df.format(System.currentTimeMillis());
		hw.setDate(df.parse(time));
		h.spxj(hw);
		return "redirect:tzhw";
	}
	//货物添加
	@RequestMapping("tzkc")
	public String tzkc(Model model, Hw hw) {
		hw.setSj(0);
		hw.setSh(1);
		model.addAttribute("list", h.sp(hw));
		return "gly/kc";
	}
    //上架
	@RequestMapping("sj")
	public String spsj(int id, Hw hw) throws ParseException {
		hw.setSh(1);
		hw.setSj(1);
		hw.setId(id);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = df.format(System.currentTimeMillis());
		hw.setDate(df.parse(time));
		h.spxj(hw);
		return "redirect:tzkc";
	}

	@RequestMapping("tzrk")
	public String tzrk() {
		return "gly/rkd";
	}

	@RequestMapping("rk")
	public String zjrk(Hw hw, HttpSession session) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = df.format(System.currentTimeMillis());
		hw.setDate(df.parse(time));
		hw.setSj(0);
		hw.setSh(0);
		String zrr = (String) session.getAttribute("name");
		hw.setZrr(zrr);
		h.xjrk(hw);
		return "redirect:tzrksh";
	}

	@RequestMapping("tzrksh")
	public String tzrush(Model model, Hw hw) {
		hw.setSh(0);
		hw.setSj(0);
		//System.out.println(hw);
		model.addAttribute("list", h.sp(hw));
		return "gly/rksh";
	}

	@RequestMapping("rks")
	public String rk(int id, Hw hw) throws ParseException {
		hw.setSj(0);
		hw.setSh(1);
		hw.setId(id);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = df.format(System.currentTimeMillis());
		hw.setDate(df.parse(time));
		h.spxj(hw);
		return "redirect:tzrksh";
	}

	@RequestMapping("tzck")
	public String tzck(Model model, Hw hw) {
		hw.setSh(1);
		hw.setSj(1);
		List list = h.sp(hw);
		model.addAttribute("list", list);
		return "gly/ckd";
	}

	@RequestMapping("ckid")
	public String ckid(int id, Model model, HttpSession session) {
		Hw list = h.dy(id);
		int jj = list.getNumber();
		session.setAttribute("jj", jj);
		session.setAttribute("gg", list.getMoney());
		model.addAttribute("list", list);
		return "gly/ckl";
	}

	@RequestMapping("ckl")
	public String ckl(Sh sh, HttpSession session, Hw hw) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = df.format(System.currentTimeMillis());
		sh.setDate(df.parse(time));
		sh.setSh(0);
		int g = sh.getJg() - sh.getMoney();
		System.out.println(g);
		sh.setLr(sh.getSl() * g);
		String name = (String) session.getAttribute("name");
		sh.setZrr(name);
		s.ck(sh);
		return "redirect:tzck";
	}

	@RequestMapping("tzcksh")
	public String cksss(Model model) {
		List list = s.cc(0);
		model.addAttribute("list", list);
		return "gly/cksh";

	}
    //
	@RequestMapping("cksh")
	public String cksh(int id, Sh sh, Hw hws, HttpSession session) throws ParseException {
		sh.setSh(1);
		sh.setHw(s.hwss(id).getHw());
		s.cksh(sh);
		Sh ssSh = new Sh();
		String name = s.hwss(id).getHw();
		List list = s.hws(name);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = df.format(System.currentTimeMillis());
		hws.setDate(df.parse(time));
		Hw hsHw = new Hw();
		hsHw = h.dys(name);
		int ye = hsHw.getNumber();
		int l = ye - s.hwss(id).getSl();
		hws.setNumber(l);
		hws.setName(name);
		h.ckkk(hws);
		return "redirect:tzcksh";
	}

	@RequestMapping("sb")
	public String sb(int id, HttpSession session) {
		s.jj(id);
		return "redirect:tzrksh";
	}

	@RequestMapping("tzbb")
	public String bb(Model model) {
	     Map map = new HashMap(); 
	     List list=new ArrayList<>();
		 //list = s.bb();
	     list=s.bbs();
	     // String str=String.join("=", list);
	     
	    //System.out.println(str);
		JSONArray json = JSONArray.fromObject(list);
		
		model.addAttribute("list", list);
		model.addAttribute("json", json);
		System.out.println(json);
		System.out.println(list);
		
		return "gly/bb";
	}
	//********************************采购******************************************
	@RequestMapping("tzkccg")
	public String tzkccg(Model model, Hw hw) {
		hw.setSj(0);
		hw.setSh(1);
		model.addAttribute("list", h.sp(hw));
		return "cg/kc";
	}
	@RequestMapping("tzrkcg")
	public String tzrkcg() {
		return "cg/rkd";
	}
	
	@RequestMapping("rkcg")
	public String zjrkcg(Hw hw, HttpSession session) throws ParseException {
		System.out.println("执行提交方法");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = df.format(System.currentTimeMillis());
		hw.setDate(df.parse(time));
		hw.setSj(0);
		hw.setSh(0);
		String zrr = (String) session.getAttribute("name");
		hw.setZrr(zrr);
		h.xjrk(hw);
		return "redirect:tzrkcg";
	}
	
	@RequestMapping("tzzupss")
	public String tzzupss(Model model,HttpSession session) {
		int  id=(int) session.getAttribute("id");
		User user = u.findid(id);
		model.addAttribute("user", user);
		return "cg/user";
	}
	
	//*************************销售**************************************
	@RequestMapping("tzckxs")
	public String tzckxs(Model model, Hw hw) {
		hw.setSh(1);
		hw.setSj(1);
		List list = h.sp(hw);
		model.addAttribute("list", list);
		return "xs/ckd";
	}
	@RequestMapping("ckidxs")
	public String ckidxs(int id, Model model, HttpSession session) {
		Hw list = h.dy(id);
		int jj = list.getNumber();
		session.setAttribute("jj", jj);
		session.setAttribute("gg", list.getMoney());
		model.addAttribute("list", list);
		return "xs/ckl";
	}
	
	@RequestMapping("cklxs")
	public String cklxs(Sh sh, HttpSession session, Hw hw) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = df.format(System.currentTimeMillis());
		sh.setDate(df.parse(time));
		sh.setSh(0);
		int g = sh.getJg() - sh.getMoney();
		System.out.println(g);
		sh.setLr(sh.getSl() * g);
		String name = (String) session.getAttribute("name");
		sh.setZrr(name);
		s.ck(sh);
		return "redirect:tzckxs";
	}
	
	
	@RequestMapping("tzzups")
	public String tzzups(Model model,HttpSession session) {
		int  id=(int) session.getAttribute("id");
		User user = u.findid(id);
		model.addAttribute("user", user);
		return "xs/user";
	}
	
    //修改用户信息
	@RequestMapping("upyhs")
	public String upyhs(User user) throws ParseException {
//		System.out.println("update");
//		System.out.println(user);
//		String password2=user.getPassword();
//		MD5Utils  md=new MD5Utils();
//	    String a=md.md5(password2);
//	    user.setPassword(a);
//	    System.out.println("修改方法被执行"+a);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH");
		String time = df.format(System.currentTimeMillis());
		user.setT1(0);
		user.setT2(0);
		user.setDate(df.parse(time));
		u.userup(user);
		return "redirect:tzlogin";
	}
}
