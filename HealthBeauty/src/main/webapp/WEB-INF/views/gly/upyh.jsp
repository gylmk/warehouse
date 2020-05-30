<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
//注册用户页面，内部注册
//账号格式验证
function userfoc() {
	document.getElementById('pUser').innerHTML = '请输入账号';
}
function userbl() {
	var str = document.getElementById("user").value;
	//校验名字是否已经存在			
	//alert(str);
      /* $.post(
          "byname",
           {name:str},
         function(data){
        	  //alert(data);
             if(data=="yes"){
            	 document.getElementById('pUser').innerHTML = '账号已存在，换个试试';
            	 document.getElementById("pUser").style.color = "red";
            	 document.getElementById("user").select();
             }else if(data=="no"){
            	 document.getElementById('pUser').innerHTML = '通过验证!';
             }else{
                   alert("异常");
             }
         }
      )      */
	//判断名字是否为空
	/* if (str!="" && str!=null) {
		document.getElementById("pUser").innerText = "通过验证";
		document.getElementById("pUser").style.color = "mediumseagreen";
	} else {
		document.getElementById("user").select();
		document.getElementById("pUser").innerText = "请输入账号";
		document.getElementById("pUser").style.color = "red";
	} */
}
//校验账号是否已经存在
$(document).ready(function(){
	  $("#user").blur(function(){
		  var str = document.getElementById("user").value;
		  $.post(
		          "byname",
		           {name:str},
		         function(data){
		        	  //alert(data);
		             if(data=="yes"){
		            	 document.getElementById('pUser').innerHTML = '账号已存在，换个试试';
		            	 document.getElementById("pUser").style.color = "red";
		            	// document.getElementById("user").select();
		             }else if(data=="no"){
		            	 document.getElementById('pUser').innerHTML = '通过验证!';
		            	 document.getElementById("pUser").style.color = "mediumseagreen";
		             }else{
		            	document.getElementById("user").select();
		         		document.getElementById("pUser").innerText = "请输入账号,不能为空";
		         		document.getElementById("pUser").style.color = "red"; 
		             }
		         }
		      )     
	  });
	});

//
//密码验证格式
function pwdfoc() {
	document.getElementById("pPassword").innerText = "请输入密码";
}

function pwdbl() {
	var pwd = document.getElementById("password").value;
	var reg = /^\w{3,18}$/;
	if (reg.test(pwd)) {
		document.getElementById("pPassword").innerText = "通过验证";
		document.getElementById("pPassword").style.color = "mediumseagreen";
	} else {
		//document.getElementById("password").select();
		document.getElementById("pPassword").innerText = "密码不得少于3位或多于18位";
		document.getElementById("pPassword").style.color = "red";
	}
}

//年龄验证
function pyfoc() {
	document.getElementById("pYear").innerText = "请输入你的年龄";
}

function pybl() {
	var age = document.getElementById("year").value;
	var reg=/[0-9]{1,2}/
	if (reg.test(age)) {
		//alert("a");
		document.getElementById("pYear").innerText = "通过验证";
		document.getElementById("pYear").style.color = "mediumseagreen";
	} else {
		//alert("b");
		document.getElementById("year").select();
		document.getElementById("pYear").innerText = "年龄格式不符合规定";
		document.getElementById("pYear").style.color = "red";
	}
}


//手机验证格式
function phfoc() {
	document.getElementById("pPhone").innerText = "手机号前两位必须是13，15，17，18";
}

function phbl() {
	var ph = document.getElementById("phone").value;
	var reg = /^1[3|5|7|8][0-9]{9}$/;
	if (reg.test(ph)) {
		document.getElementById("pPhone").innerText = "通过验证";
		document.getElementById("pPhone").style.color = "mediumseagreen";
	} else {
		document.getElementById("phone").select();
		document.getElementById("pPhone").innerText = "密码格式不符合规定";
		document.getElementById("pPhone").style.color = "red";
	}
}

</script>	
	
<script>
//
//注册用户页面   
//
/* $().ready(function() {
		//alert(0);
	 }); */
	(function($) {
		$(window).load(
				function() {

					$("a[rel='load-content']").click(
							function(e) {
								e.preventDefault();
								var url = $(this).attr("href");
								$.get(url, function(data) {
									$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
									//scroll-to appended content 
									$(".content").mCustomScrollbar("scrollTo",
											"h2:last");
								});
							});

					$(".content").delegate(
							"a[href='top']",
							"click",
							function(e) {
								e.preventDefault();
								$(".content").mCustomScrollbar("scrollTo",
										$(this).attr("href"));
							});

				});
	})(jQuery);
</script>
</head>
<body>
	<!--header-->
	<header>
		<h1>
			<img
				src="${pageContext.request.contextPath}/assets/images/admin_logo.png" />
		</h1>
		<ul class="rt_nav">
			<li><a href="tzzup" class="set_icon">账号设置</a></li>
			
			<li><a href="tzlogin" class="quit_icon">安全退出</a></li>
		</ul>
	</header>
	<!--aside nav-->
	<!--aside nav-->
		<aside class="lt_aside_nav content mCustomScrollbar">

		<ul>
			<li>
				<dl>
					<dt>用户管理</dt>
					<!--当前链接则添加-->
					<dd>
						<a href="sy" >用户列表</a>
					</dd>
					<dd>
						<a href="tjyh" class="active">添加用户</a>
					</dd>
				</dl>
			</li>
						<li>
				<dl>
					<dt>货物管理</dt>
					<dd>
						<a href="tzhw">货物列表</a>
					</dd>
					<dd>
						<a href="tzkc">库存列表</a>
					</dd>					
				</dl>
			</li>
			<li>
				<dl>
					<dt>入库管理</dt>					
					<dd>
						<a href="tzrk">新建入库单</a>
					</dd>					
					<dd>
						<a href="tzrksh">入库单审核</a>
					</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>出库管理</dt>									
					<dd>
						<a href="tzck">新建出库单</a>
					</dd>
					<dd>
						<a href="tzcksh">出库单审核</a>
					</dd>

				</dl>
			</li>
			<li>
				<dl>
					<dt>报表管理</dt>
					<dd>
						<a href="tzbb">生成报表</a>
					</dd>
				</dl>
			</li>	
		</ul>
	</aside>

	
<section class="rt_wrap content mCustomScrollbar">
<form action="insert" method="post">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">请输入用户信息</h2>
      </div>
      <ul class="ulColumn2">
       <li>
        <span class="item_name" style="width:120px;">用户账号：</span>
        <input type="text" onfocus="userfoc()" onblur="userbl()" id="user" name="name" class="textbox textbox_225"  placeholder="用户账号..."/>
        <span id="pUser"></span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">登陆密码：</span>
        <input type="password" onfocus="pwdfoc()" onblur="pwdbl()" id="password" name="password" class="textbox textbox_225"  placeholder="登录密码..."/>
        <span id="pPassword"></span>
       </li>
       <li>
        <span class="item_name" style="width:120px;" name="sex">性别：</span>
        <select class="select" name="sex">
         <option value="0" name="sex">男</option>
         <option value="1" name="sex">女</option>
        </select>
       </li>
       <li>
        <span class="item_name" style="width:120px;">年龄：</span>
        <input type="number" onfocus="pyfoc()" onblur="pybl()" name="year" id="year"  class="textbox textbox_225" placeholder="年龄..."/>
        <span id="pYear"></span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">联系电话：</span>
        <input type="tel" onfocus="phfoc()" onblur="phbl()" name="phone" id="phone" class="textbox textbox_225"  placeholder="联系电话..."/>
        <span id="pPhone"></span>
       </li>
       <li>
        <span class="item_name" style="width:120px;"  name="t1">角色分配：</span>
        <select class="select"  name="t1">
          <option name="t1" value="0">管理员</option>
         <option name="t1" value="1" >经理</option>
         <option name="t1" value="2" >销售</option>
         <option name="t1" value="3" >采购</option>
        </select>
       </li>
        <li>
        <span class="item_name" style="width:120px;" name="t2">验证：</span>
        <select class="select" name="t2">
          <option value="0" name="t2">通过</option>
         <option value="1" name="t2">不通过</option>
        </select>
       </li>
       <li>
        <span class="item_name" style="width:120px;"></span>
        <input type="submit" class="link_btn" value="更新/保存"/>
       </li>
      </ul>
 </div>
 </form>
</section>

</body>
</html>
