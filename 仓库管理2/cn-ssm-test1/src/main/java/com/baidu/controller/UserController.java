package com.baidu.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baidu.entity.User;
import com.baidu.service.UserServiceI;
import com.baidu.utils.MD5Utils;

@Controller
public class UserController {
	@Autowired
	private UserServiceI userService;
	
	/**
	 * 用户登陆方法
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value="login")
	@ResponseBody
	private User login(User user,HttpServletRequest request){
		String password = MD5Utils.md5(user.getPassword());
		user.setPassword(password);
		User u = this.userService.login(user);
		
		if (null!=u) {
			request.getSession().setAttribute("user",u);
			return u;
		}
		return null;
	}
	
	//跳转至登陆页面
	@RequestMapping(value="userAction_toLogin")
	public String userAction_toLogin(){
		return "forward:login.jsp";
	}
}
