/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2020-05-31 01:37:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.goods;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class save_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<title>收货登记</title>\r\n");
      out.write("\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      if (_jspx_meth_c_005furl_005f0(_jspx_page_context))
        return;
      out.write("\"></link>\r\n");
      out.write("\t\t<style type=\"text/css\">\r\n");
      out.write("\t\t\t.tx td {\r\n");
      out.write("\t\t\t\tpadding: 3px;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t</style>\r\n");
      out.write("\t\t<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jquery-1.8.3.js\"></script>\r\n");
      out.write("\t\t<!-- <script type=\"text/javascript\">\r\n");
      out.write("\t\t//加载仓库信息，通过ajax \r\n");
      out.write("\t\t//加载仓库信息，通过ajax \r\n");
      out.write("\t\t\t$(function(){\r\n");
      out.write("\t\t\t\t//alert(\"运行\");\r\n");
      out.write("\t\t\t\tvar url = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/goodsAction_findAllStore\";\r\n");
      out.write("\t\t\t\t$.post(url,function(data){\r\n");
      out.write("\t\t\t\t\tif(data.length>0){\r\n");
      out.write("\t\t\t\t\t\tfor(var i=0;i<data.length;i++){\r\n");
      out.write("\t\t\t\t\t\t\t//alert(data[i].addr);\r\n");
      out.write("\t\t\t\t\t\t\tvar id = data[i].id;\r\n");
      out.write("\t\t\t\t\t\t\tif(id=='");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${store.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("'){\r\n");
      out.write("\t\t\t\t\t\t\t\t$(\"#selectStores\").append(\"<option selected='selected' value=\"+data[i].id+\">\"+data[i].name+\"</option>\")\r\n");
      out.write("\t\t\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\t\t\t$(\"#selectStores\").append(\"<option  value=\"+data[i].id+\">\"+data[i].name+\"</option>\")\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t},'json');\r\n");
      out.write("\r\n");
      out.write("\t\t\t$(\"#goods_nm\").blur(function(){\r\n");
      out.write("\t\t\t\t//alert(\"test\");\r\n");
      out.write("\t\t\t\tvar url = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/goodsAction_findGoodsByNm\"\r\n");
      out.write("\t\t\t\t$.post(url,{'nm':$(this).val()},function(data){\r\n");
      out.write("\t\t\t\t\t\tif(data=='0'){//没查到nm对应的记录\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#goods_id\").val('');\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#goods_name\").val('');\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#goods_unit\").val('');\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#goods_amount\").val('');\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#selectStores\").val('');\r\n");
      out.write("\t\t\t\t\t\t}else{//查到nm对应的记录\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#goods_id\").val(data.id);\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#goods_name\").val(data.name);\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#goods_unit\").val(data.unit);\r\n");
      out.write("\t\t\t\t\t\t\t//$(\"#goods_amount\").val(data.amount);\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#selectStores\").val(data.store.id);\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t}\t\r\n");
      out.write("\t\t\t\t\t},'json');\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t</script> -->\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t<!-- 中间内容（开始） -->\r\n");
      out.write("\t\t<table border=\"0\" class=\"tx\" width=\"100%\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t当前位置&gt;&gt;首页&gt;&gt;入库\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n");
      out.write("\t\t\t<tr valign=\"top\">\r\n");
      out.write("\t\t\t\t<td rowspan=\"2\">\r\n");
      out.write("\t\t\t\t\t<form action=\"\" namespace=\"/\" method=\"post\" theme=\"simple\" name=\"select\">\r\n");
      out.write("\t\t\t\t\t\t<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"tx\" align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t\t\t\t\t<col width=\"20%\" align=\"right\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<col width=\"*%\" align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t</colgroup>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td bgcolor=\"a0c0c0\" style=\"padding-left: 10px;\" colspan=\"2\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\talign=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<b>货物入库登记：</b>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t简记码：\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"ids\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" style=\"border-color: green;\" name=\"nm\" onblur=\"checkNm()\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t货物名称：\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" style=\"border-color: green;\" name=\"goodname\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t计量单位：\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" style=\"border-color: green;\" name=\"unit\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t入库数量：\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" style=\"border-color: green;\" name=\"amount\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t选择仓库：\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<select class=\"tx\" style=\"width: 120px;\" name=\"storeid\" id=\"selectStores\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<option value=\"\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t请选择仓库\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td colspan=\"2\" align=\"center\" style=\"padding-top: 10px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input class=\"tx\" style=\"width: 120px; margin-right: 30px;\" type=\"button\" onclick=\"addgood()\" value=\"入库\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input class=\"tx\" style=\"width: 120px; margin-right: 30px;\" type=\"reset\" value=\"取消\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</body>\r\n");
      out.write("\t<!--根据简记码查询-->\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t//回显仓库下拉菜单\r\n");
      out.write("\t\t$(document).ready(function() {\r\n");
      out.write("\t\t\tvar url = \"");
      out.print(request.getContextPath());
      out.write("/goodsAction_findAllStore.do\";\r\n");
      out.write("\t\t\t$.post(\r\n");
      out.write("\t\t\t\t//路径\r\n");
      out.write("\t\t\t\turl,\r\n");
      out.write("\t\t\t\t//回调函数\r\n");
      out.write("\t\t\t\tfunction(data) {\r\n");
      out.write("\t\t\t\t\tfor ( var i in data) {\r\n");
      out.write("\t\t\t\t\t\t$(\"#selectStores\").append(\"<option value='\"+data[i].id+\"'>\"+data[i].name+\"</option>\");\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t},\r\n");
      out.write("\t\t\t\t//返回类型\r\n");
      out.write("\t\t\t\t\"json\"\r\n");
      out.write("\t\t\t);\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t//验证商品简拼是否存在|并且获取数据对象\r\n");
      out.write("\t\tfunction checkNm() {\r\n");
      out.write("\t\t\t//获取简记码的值\r\n");
      out.write("\t\t\tvar nm = $(\"[name='nm']\").val();\r\n");
      out.write("\t\t\tvar url = \"");
      out.print(request.getContextPath());
      out.write("/checkByStoreNm.do\";\r\n");
      out.write("\t\t\t$.post(\r\n");
      out.write("\t\t\t\t//路径\r\n");
      out.write("\t\t\t\turl,\r\n");
      out.write("\t\t\t\t//传值\r\n");
      out.write("\t\t\t\t{nm:nm},\r\n");
      out.write("\t\t\t\t//回调函数\r\n");
      out.write("\t\t\t\tfunction(data) {\r\n");
      out.write("\t\t\t\t\tif(data.length>0) {\r\n");
      out.write("\t\t\t\t\t\tfor ( var i in data) {\r\n");
      out.write("\t\t\t\t\t\t\t$(\"[name='nm']\").val(data[i].nm);\r\n");
      out.write("\t\t\t\t\t\t\t$(\"[name='goodname']\").val(data[i].goodname);\r\n");
      out.write("\t\t\t\t\t\t\t$(\"[name='unit']\").val(data[i].unit);\r\n");
      out.write("\t\t\t\t\t\t\t//商品ids\r\n");
      out.write("\t\t\t\t\t\t\tvar ids = data[i].ids;\r\n");
      out.write("\t\t\t\t\t\t\t$(\"[name='ids']\").val(ids);\r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t//商品外键storeid\r\n");
      out.write("\t\t\t\t\t\t\tvar storeid = data[i].storeid;\r\n");
      out.write("\t\t\t\t\t\t\t//仓库id\r\n");
      out.write("\t\t\t\t\t\t\tvar id = data[i].id;\r\n");
      out.write("\t\t\t\t\t\t\tif (id==storeid) {\r\n");
      out.write("\t\t\t\t\t\t\t\t$(\"[name='storeid']\").append(\"<option selected='selected' value='\"+data[i].id+\"'>\"+data[i].name+\"</option>\");\r\n");
      out.write("\t\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t},\r\n");
      out.write("\t\t\t\t//返回类型\r\n");
      out.write("\t\t\t\t\"json\"\r\n");
      out.write("\t\t\t);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t//入库\r\n");
      out.write("\t\tfunction addgood() {\r\n");
      out.write("\t\t\t//取出商品的id做判断\r\n");
      out.write("\t\t\tvar ids = $(\"[name='ids']\").val();\r\n");
      out.write("\t\t\t//入库数量\r\n");
      out.write("\t\t\tvar amount = $(\"[name='amount']\").val();\r\n");
      out.write("\t\t\t//上传路径\r\n");
      out.write("\t\t\tvar url = \"");
      out.print(request.getContextPath());
      out.write("/updategood.do\";\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif (null!=ids && \"\"!=ids) {\r\n");
      out.write("\t\t\t\t//修改商品的库存量\r\n");
      out.write("\t\t\t\t$.post(\r\n");
      out.write("\t\t\t\t\t//路径\r\n");
      out.write("\t\t\t\t\turl,\r\n");
      out.write("\t\t\t\t\t//传值\r\n");
      out.write("\t\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t\tids:ids,\r\n");
      out.write("\t\t\t\t\t\tnum:amount\r\n");
      out.write("\t\t\t\t\t},\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t//回调函数\r\n");
      out.write("\t\t\t\t\tfunction(data) {\r\n");
      out.write("\t\t\t\t\t\tif (true==data) {\r\n");
      out.write("\t\t\t\t\t\t\talert(\"已成功入库\");\r\n");
      out.write("\t\t\t\t\t\t\twindow.location.href=\"");
      out.print(request.getContextPath());
      out.write("/goodsAction_searchUI.do\";\r\n");
      out.write("\t\t\t\t\t\t}else {\r\n");
      out.write("\t\t\t\t\t\t\talert(\"入库失败\");\r\n");
      out.write("\t\t\t\t\t\t\twindow.location.href=\"");
      out.print(request.getContextPath());
      out.write("/goodsAction_searchUI.do\";\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\t//返回类型\r\n");
      out.write("\t\t\t\t\t\"json\"\r\n");
      out.write("\t\t\t\t);\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\t//添加新的商品(商品信息不存在)\r\n");
      out.write("\t\t\t\tvar url = \"");
      out.print(request.getContextPath());
      out.write("/addgood.do\";\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$.post(\r\n");
      out.write("\t\t\t\t\t//路径\r\n");
      out.write("\t\t\t\t\turl,\r\n");
      out.write("\t\t\t\t\t//传值\r\n");
      out.write("\t\t\t\t\t$(\"form\").serialize(),\r\n");
      out.write("\t\t\t\t\t//回调函数\r\n");
      out.write("\t\t\t\t\tfunction(data) {\r\n");
      out.write("\t\t\t\t\t\tif (true==data) {\r\n");
      out.write("\t\t\t\t\t\t\talert(\"已成功入库\");\r\n");
      out.write("\t\t\t\t\t\t\twindow.location.href=\"");
      out.print(request.getContextPath());
      out.write("/goodsAction_searchUI.do\";\r\n");
      out.write("\t\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\t\talert(\"入库失败\");\r\n");
      out.write("\t\t\t\t\t\t\twindow.location.href=\"");
      out.print(request.getContextPath());
      out.write("/goodsAction_searchUI.do\";\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\t//返回类型\r\n");
      out.write("\t\t\t\t\t\"json\"\r\n");
      out.write("\t\t\t\t);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005furl_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:url
    org.apache.taglibs.standard.tag.rt.core.UrlTag _jspx_th_c_005furl_005f0 = (org.apache.taglibs.standard.tag.rt.core.UrlTag) _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.UrlTag.class);
    _jspx_th_c_005furl_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005furl_005f0.setParent(null);
    // /WEB-INF/jsp/goods/save.jsp(7,47) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005furl_005f0.setValue("/css/maple.css");
    int _jspx_eval_c_005furl_005f0 = _jspx_th_c_005furl_005f0.doStartTag();
    if (_jspx_th_c_005furl_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005furl_0026_005fvalue_005fnobody.reuse(_jspx_th_c_005furl_005f0);
    return false;
  }
}
