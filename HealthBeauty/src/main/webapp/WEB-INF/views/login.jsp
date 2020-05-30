<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/bootstrap/bootstrap.css'
	media='all' rel='stylesheet' type='text/css' />
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/bootstrap/bootstrap-responsive.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / jquery ui -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/jquery_ui/jquery-ui-1.10.0.custom.css'
	media='all' rel='stylesheet' type='text/css' />
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/jquery_ui/jquery.ui.1.10.0.ie.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / switch buttons -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/bootstrap_switch/bootstrap-switch.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / xeditable -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/xeditable/bootstrap-editable.css'
	media='all' rel='stylesheet' type='text/css' />
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/common/bootstrap-wysihtml5.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / wysihtml5 (wysywig) -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/common/bootstrap-wysihtml5.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / jquery file upload -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/jquery_fileupload/jquery.fileupload-ui.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / full calendar -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/fullcalendar/fullcalendar.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / select2 -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/select2/select2.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / mention -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/mention/mention.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / tabdrop (responsive tabs) -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/tabdrop/tabdrop.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / jgrowl notifications -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/jgrowl/jquery.jgrowl.min.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / datatables -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/datatables/bootstrap-datatable.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / dynatrees (file trees) -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/dynatree/ui.dynatree.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / color picker -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/bootstrap_colorpicker/bootstrap-colorpicker.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / datetime picker -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / daterange picker) -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / flags (country flags) -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/flags/flags.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / slider nav (address book) -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/slider_nav/slidernav.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / fuelux (wizard) -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/plugins/fuelux/wizard.css'
	media='all' rel='stylesheet' type='text/css' />
<!-- / flatty theme -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/light-theme.css'
	id='color-settings-body-color' media='all' rel='stylesheet'
	type='text/css' />
<!-- / demo -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/demo.css'
	media='all' rel='stylesheet' type='text/css' />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>仓库系统登录</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/moban/css/index.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/moban/css/animate-custom.css" />
<script type="text/javascript" >
//账号格式验证
/* function userfoc() {
	document.getElementById('pUser').innerHTML = '请输入账号';
}
function userbl() {
	var str = document.getElementById("usernamesignup").value;
	if (str!="" && str!=null) {
		document.getElementById("pUser").innerText = "通过验证";
		document.getElementById("pUser").style.color = "mediumseagreen";
	} else {
		document.getElementById("user").select();
		document.getElementById("pUser").innerText = "请输入账号";
		document.getElementById("pUser").style.color = "red";
	}
}
//密码验证格式
function pwdfoc() {
	document.getElementById("pPassword").innerText = "密码不得少于3位或多于18位";
}

function pwdbl() {
	var pwd = document.getElementById("password").value;
	var reg = /^\w{3,18}$/;
	if (reg.test(pwd)) {
		document.getElementById("pPassword").innerText = "通过验证";
		document.getElementById("pPassword").style.color = "mediumseagreen";
	} else {
		document.getElementById("password").select();
		document.getElementById("pPassword").innerText = "密码格式不符合规定";
		document.getElementById("pPassword").style.color = "red";
	}
} */
//异步校验,检查名字是否已经存在
/* $().ready(function() {
	$(function(){
		//alert("a");
	      $("#ename").blur(function(){
	    	 // alert("b");
	      $.post(
	          "byname",
	         {name:$("#ename").val()},
	         function(data){
	             if(data=="yes"){
	                  alert("员工存在");
	             }else if(data=="no"){
	                   alert("员工部不存在");
	             }else{
	                   alert("异常");
	             }
	         }
	      )   
	  });  
	});
	 });


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
} */

	
	//设置一个全局的变量，便于保存验证码
	var code;
	function createCode() {
		//首先默认code为空字符串
		code = '';
		//设置长度，这里看需求，我这里设置了4
		var codeLength = 4;
		var codeV = document.getElementById('code');
		//设置随机字符
		var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C',
				'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
				'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
		
		//context.fillStyle = gradient;//设置字体颜色
		
		//循环codeLength 我设置的4就是循环4次
		for (var i = 0; i < codeLength; i++) {
			//设置随机数范围,这设置为0 ~ 36
			var index = Math.floor(Math.random() * 36);
			//字符串拼接 将每次随机的字符 进行拼接
			code += random[index];
		}
		//将拼接好的字符串赋值给展示的Value
		codeV.value = code;
	}

	//下面就是判断是否== 的代码，无需解释
	function validate() {
		var oValue = document.getElementById('input').value.toUpperCase();
		if (oValue == 0) {
			alert('请确认是否输入正确！');
			document.getElementById('input').value = "";
			//window.history.go(-1);
			//window.history.go(0);
			//window.navigate(location) 
			event.preventDefault();
			return true;
		} else if (oValue != code) {
			alert('验证码不正确，请重新输入！');
			document.getElementById('input').value = "";
			/* window.history.go(-1);
			window.history.go(0);
			window.navigate(location)  */
			event.preventDefault();
			return true;
		} else {
			var name = $("#username").val();
			var password = $("#password").val();
			var requestDate = {};
			requestDate["name"] = name;
			requestDate["password"] = password;
			var str = JSON.stringify(requestDate);
			if (name == "") {
				alert("请填写登录名");
				return;
			}
			if (password == "") {
				alert("请填写密码");
				return;
			}
			$.ajax({
				type : "post",
				dataType : 'json',//默认转化对象
				async : true,
				url : "login", //提交到一般处理程序请求数据

				data : {
					"requestDate" : str
				},
				error : function() {
					alert("登录失败,请与管理员联系qq:1234567890")
				},
				success : function(data) {
					var suc = data.succ;

					if (suc == "false") {
						alert("登录失败，请确认用户名与密码");
					} else {
						//alert("登录成功")
						window.location.href = "sy.do";
					}
				}
			})
		}
	}
</script>
</head>
<body  style="background: #fff url(../images/bga.jpg) repeat top left;
        background-size: cover;
">

	<div id="container_demo" >
		<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
			id="tologin"></a>
		<div id="wrapper" >
			<div id="login" class="animate form" >

				<h1>森芸仓库管理系统</h1>
				<p>
					<label for="username" class="uname" data-icon="u">您的账户名</label> <input
						id="username"  name="username" required="required" type="text"
						placeholder="请输入账户名" />
				</p>
				<p>
					<label for="password" class="youpasswd" data-icon="p">您的密码</label>
					<input id="password"  name="password" required="required"
						type="password" placeholder="请输入密码" />
				</p>
				<p class="form form-horizontal validate-form">
				<table>
					<tr>
						<td><label for="username" class="uname">验证码</label></td>
						<td><input type="button" id="code" onclick="createCode()"
							style="width: 35px; height: 15px; margin-left: 12px" />&nbsp;</td>
						<td><input type="text" id="input" value=""
							style="width: 45px; height: 15px; margin-left: 12px" />&nbsp;</td>
					</tr>
				</table>
				</p>
				<p class="login button">
					<input type="submit" value="登录" onclick="validate()" />
				</p>
				<p class="change_link">
					不是成员?<a href="#toregister" class="to_register">加入我们</a>
				</p>

			</div>
			
			
            <!-- 注册页面 -->
			<div id="register" class="animate form">
				<form action="touser" autocomplete="on"  method="post">
					<h1>注册</h1>
					<p>
						<label for="usernamesignup" class="uname" data-icon="u">用户名</label>
						<input type="text" id="usernamesignup"  name="name" required="required" placeholder="用户名" />
						
					</p>
					<p>
						<label for="passwordsignup" class="youpasswd" data-icon="p">密码</label>
						<input type="password" id="passwordsignup" name="password" required="required"  placeholder="密码" />
						
					</p>
					<p>
						<label for="passwordsignup" class="youpasswd" data-icon="s">性别</label>
						<select class="form-control" name="sex" id="name">
							<option value="0" name="男" id="name">男</option>
							<option value="1" name="女" id="name">女</option>
						</select>
					</p>
					<p>
						<label for="passwordsignup" class="youpasswd" data-icon="y">年龄</label>
						<input type="number" id="passwordsignup" name="year" required="required"  placeholder="年龄" />
						
					</p>
					<p>
						<label for="passwordsignup" class="youpasswd" data-icon="ph">联系电话</label>
						<input type="text" id="passwordsignup" name="phone" required="required"  placeholder="联系电话" />
							
					</p>
					
					<p class="signin button" >
						<input type="submit" value="注册" "/>
					</p>
					<p class="change_link">
						已经是成员?<a href="#tologin" class="to_register"> 去登录 </a>
					</p>
				</form>
			</div>

		</div>

	</div>

	<script
		src='assets/javascripts/jquery/jquery.min.js'
		type='text/javascript'></script>
	<!-- / jquery mobile events (for touch and slide) -->
	<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
	<script
		src='assets/javascripts/plugins/mobile_events/jquery.mobile-events.min.js'
		type='text/javascript'></script>
	<!-- / jquery migrate (for compatibility with new jquery) -->
	<script
		src='assets/javascripts/jquery/jquery-migrate.min.js'
		type='text/javascript'></script>
	<!-- / jquery ui -->
	<script
		src='assets/javascripts/jquery_ui/jquery-ui.min.js'
		type='text/javascript'></script>
	<!-- / bootstrap -->
	<script
		src='assets/javascripts/bootstrap/bootstrap.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/flot/excanvas.js'
		type='text/javascript'></script>
	<!-- / sparklines -->
	<script
		src='assets/javascripts/plugins/sparklines/jquery.sparkline.min.js'
		type='text/javascript'></script>
	<!-- / flot charts -->
	<script
		src='assets/javascripts/plugins/flot/flot.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/flot/flot.resize.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/flot/flot.pie.js'
		type='text/javascript'></script>
	<!-- / bootstrap switch -->
	<script
		src='assets/javascripts/plugins/bootstrap_switch/bootstrapSwitch.min.js'
		type='text/javascript'></script>
	<!-- / fullcalendar -->
	<script
		src='assets/javascripts/plugins/fullcalendar/fullcalendar.min.js'
		type='text/javascript'></script>
	<!-- / datatables -->
	<script
		src='assets/javascripts/plugins/datatables/jquery.dataTables.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js'
		type='text/javascript'></script>
	<!-- / wysihtml5 -->
	<script
		src='assets/javascripts/plugins/common/wysihtml5.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/common/bootstrap-wysihtml5.js'
		type='text/javascript'></script>
	<!-- / select2 -->
	<script
		src='assets/javascripts/plugins/select2/select2.js'
		type='text/javascript'></script>
	<!-- / color picker -->
	<script
		src='assets/javascripts/plugins/bootstrap_colorpicker/bootstrap-colorpicker.min.js'
		type='text/javascript'></script>
	<!-- / mention -->
	<script
		src='assets/javascripts/plugins/mention/mention.min.js'
		type='text/javascript'></script>
	<!-- / input mask -->
	<script
		src='assets/javascripts/plugins/input_mask/bootstrap-inputmask.min.js'
		type='text/javascript'></script>
	<!-- / fileinput -->
	<script
		src='assets/javascripts/plugins/fileinput/bootstrap-fileinput.js'
		type='text/javascript'></script>
	<!-- / modernizr -->
	<script
		src='assets/javascripts/plugins/modernizr/modernizr.min.js'
		type='text/javascript'></script>
	<!-- / retina -->
	<script
		src='assets/javascripts/plugins/retina/retina.js'
		type='text/javascript'></script>
	<!-- / fileupload -->
	<script
		src='assets/javascripts/plugins/fileupload/tmpl.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/fileupload/load-image.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/fileupload/canvas-to-blob.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/fileupload/jquery.iframe-transport.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/fileupload/jquery.fileupload.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/fileupload/jquery.fileupload-fp.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/fileupload/jquery.fileupload-ui.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/fileupload/jquery.fileupload-init.js'
		type='text/javascript'></script>
	<!-- / timeago -->
	<script
		src='assets/javascripts/plugins/timeago/jquery.timeago.js'
		type='text/javascript'></script>
	<!-- / slimscroll -->
	<script
		src='assets/javascripts/plugins/slimscroll/jquery.slimscroll.min.js'
		type='text/javascript'></script>
	<!-- / autosize (for textareas) -->
	<script
		src='assets/javascripts/plugins/autosize/jquery.autosize-min.js'
		type='text/javascript'></script>
	<!-- / charCount -->
	<script
		src='assets/javascripts/plugins/charCount/charCount.js'
		type='text/javascript'></script>
	<!-- / validate -->
	<script
		src='assets/javascripts/plugins/validate/jquery.validate.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/validate/additional-methods.js'
		type='text/javascript'></script>
	<!-- / naked password -->
	<script
		src='assets/javascripts/plugins/naked_password/naked_password-0.2.4.min.js'
		type='text/javascript'></script>
	<!-- / nestable -->
	<script
		src='assets/javascripts/plugins/nestable/jquery.nestable.js'
		type='text/javascript'></script>
	<!-- / tabdrop -->
	<script
		src='assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js'
		type='text/javascript'></script>
	<!-- / jgrowl -->
	<script
		src='assets/javascripts/plugins/jgrowl/jquery.jgrowl.min.js'
		type='text/javascript'></script>
	<!-- / bootbox -->
	<script
		src='assets/javascripts/plugins/bootbox/bootbox.min.js'
		type='text/javascript'></script>
	<!-- / inplace editing -->
	<script
		src='assets/javascripts/plugins/xeditable/bootstrap-editable.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/xeditable/wysihtml5.js'
		type='text/javascript'></script>
	<!-- / ckeditor -->
	<script
		src='assets/javascripts/plugins/ckeditor/ckeditor.js'
		type='text/javascript'></script>
	<!-- / filetrees -->
	<script
		src='assets/javascripts/plugins/dynatree/jquery.dynatree.min.js'
		type='text/javascript'></script>
	<!-- / datetime picker -->
	<script
		src='assets/javascripts/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js'
		type='text/javascript'></script>
	<!-- / daterange picker -->
	<script
		src='assets/javascripts/plugins/bootstrap_daterangepicker/moment.min.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.js'
		type='text/javascript'></script>
	<!-- / max length -->
	<script
		src='assets/javascripts/plugins/bootstrap_maxlength/bootstrap-maxlength.min.js'
		type='text/javascript'></script>
	<!-- / dropdown hover -->
	<script
		src='assets/javascripts/plugins/bootstrap_hover_dropdown/twitter-bootstrap-hover-dropdown.min.js'
		type='text/javascript'></script>
	<!-- / slider nav (address book) -->
	<script
		src='assets/javascripts/plugins/slider_nav/slidernav-min.js'
		type='text/javascript'></script>
	<!-- / fuelux -->
	<script
		src='assets/javascripts/plugins/fuelux/wizard.js'
		type='text/javascript'></script>
	<!-- / flatty theme -->
	<script
		src='assets/javascripts/nav.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/tables.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/theme.js'
		type='text/javascript'></script>
	<!-- / demo -->
	<script
		src='assets/javascripts/demo/jquery.mockjax.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/demo/inplace_editing.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/demo/charts.js'
		type='text/javascript'></script>
	<script
		src='assets/javascripts/demo/demo.js'
		type='text/javascript'></script>
	<script>
	//设置此处的原因是每次进入界面展示一个随机的验证码，不设置则为空
	$().ready(function() {
		createCode();
	 });
	/* function adduser(){
		alert("asd");
		$.ajax({
			type : "post",
			dataType : 'json',//默认转化对象
			async : true,
			url : "touser", //提交到一般处理程序请求数据
			success: function(data){
				alert("dddd");
				if(data=="yes"){
					alert("注册成功！");
					window.location.href = "tzlogin";
				}else{
					alert("注册失败！");
				}
			  }

		})
		
	} */
	
	
		$(function() {
			$(".icon-save").click(function() {
				var name = $("#username").val();
				var password = $("#password").val();
				var requestDate = {};
				requestDate["name"] = name;
				requestDate["password"] = password;
				var str = JSON.stringify(requestDate);
				if (name == "") {
					alert("请填写登录名");
					return;
				}
				if (password == "") {
					alert("请填写密码");
					return;
				}
				$.ajax({
					type : "get",
					dataType : 'json',//默认转化对象
					async : true,
					url : "login", //提交到一般处理程序请求数据

					data : {
						"requestDate" : str
					},
					error : function() {
						alert("登录失败,请与管理员联系")
					},
					success : function(data) {
						var suc = data.succ;

						if (suc == "false") {
							alert("登录失败，请确认用户名与密码");
						} else {
							alert("登录成功")
							window.location.href = "sy.do";
						}
					}
				})
			})
		})
	</script>
</body>
</html>