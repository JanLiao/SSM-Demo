<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.jan.pojo.User"%>
<% 
   User user = (User)session.getAttribute("user");  
   if(user != null) {
     request.setAttribute("userName", user.getUserName());
     //request.setAttribute("roleName", user.getRole().getRoleName());
   }
   
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta content="text/html;charset=UTF-8"/>
	<title>主页</title>
	<meta name="keywords" content="fsLayuiPlugin,layui,layuiPlugin,layui插件,layui快速开发插件" />
    <meta name="description" content="fsLayuiPlugin,layui,layuiPlugin,layui插件,layui快速开发插件" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta http-equiv ="Pragma" content = "no-cache"/>
	<meta http-equiv="Cache-Control" content="no cache" />
	<meta http-equiv="Expires" content="0" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no"/>
	<%@ include file="/layui/header.jsp"%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/front/css/jquery.toast.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/front/js/jquery.toast.js"></script>
	<style>
/* 为了区分效果 */
div[carousel-item]>*{text-align: center; line-height: 280px; color: #fff;}
div[carousel-item]>*:nth-child(4n){background-color: #009688;}
div[carousel-item]>*:nth-child(4n+1){background-color: #5FB878;}
div[carousel-item]>*:nth-child(4n+2){background-color: #01AAED;}
div[carousel-item]>*:nth-child(4n+3){background-color: #FF5722;}
#test2 div[carousel-item]>*{line-height: 120px;}
</style>
</head>
<body>
<div class="layui-layout layui-layout-admin">

  <!-- 顶部 -->
  <div class="layui-header">
    <a href="./index.html" class="layui-hide-xs"><div class="layui-logo">血压标注系统</div></a>
    <a href="javascript:;" class="layui-hide-xs"><div class="fsSwitchMenu"><i class="fa fa-outdent"></i></div></a>
    
    <ul class="layui-nav layui-layout-right">
      
      <li class="layui-nav-item">
						<a class="name" href="javascript:;"><i class="layui-icon"></i>主题<span class="layui-nav-more"></span></a>
						<dl class="layui-nav-child layui-anim layui-anim-upbit">
							<dd>
								<a skin="hp-black-theme" class="hp-theme-skin-switch"  href="javascript:;">低调黑</a>
							</dd>
							<dd >
								<a skin="hp-blue-theme" class="hp-theme-skin-switch" href="javascript:;">炫酷蓝</a>
							</dd>
							<dd>
								<a skin="hp-green-theme" class="hp-theme-skin-switch"  href="javascript:;">原谅绿</a>
							</dd>
						</dl>
					</li>
      
      <li class="layui-nav-item"><a href="javascript:;"  style="text-decoration:none" class="admin-header-user"> 
						<img src="<%=request.getContextPath()%>/layui/images/100.jpg" class="layui-nav-img"/>
						 <span id="name"><%=session.getAttribute("userName") %></span>
					</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;" onClick="personMessage()" style="text-decoration:none"><i class="fa fa-user-circle"
									aria-hidden="true"></i> 个人信息</a>
							</dd>
							<dd>
								<a href="javascript:;" onClick="set()" style="text-decoration:none"><i class="fa fa-gear"
									aria-hidden="true"></i> 设置</a>
							</dd>
							<dd>
								<a href="javascript:;" onClick="logout()" style="text-decoration:none"><i class="fa fa-sign-out"
									aria-hidden="true"></i> 注销</a>
							</dd>
						</dl></li>
    </ul>
  </div>


  <!-- 左边菜单 -->
  <div class="layui-side layui-bg-black left-menu-all">
			<div class="layui-side-scroll">
				<ul class="layui-nav layui-nav-tree left-menu" lay-filter="tabDemo">
					<c:forEach var="item" items="${resourcesMap}">
						<li class="layui-nav-item"><a href="javascript:;" style="text-decoration:none">${item.key}</a>
							<dl class="layui-nav-child">
								<c:forEach items="${item.value}" var="col">
									<dd>
										<a class="zn-tab-add" zn-href="<%=request.getContextPath()%>${col.resourceUrl}" href="javascript:;" style="text-decoration:none"> &nbsp;&nbsp;&nbsp;${col.resourceName}</a>
									</dd>
								</c:forEach>
							</dl>
						</li>
					</c:forEach>
				</ul>
    </div>
  </div>

  <!-- 右边内容区域 -->
  <div class="layui-body layui-form">
  	<div class="layui-tab layui-tab-card fsTab" lay-filter="tabDemo" lay-allowClose="true">
  		
  		<!-- 菜单导航 -->
		<ul class="layui-tab-title" id="fsTabMenu">
			<li class="layui-this" lay-id="111"><i class="layui-icon">&#xe68e;</i><cite>首页</cite><p class="layui-tab-close" style="display: none;"></p></li>
		</ul>
		<!-- 内容 -->
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show" lay-id="1">
				<br><br>
				<div style="width:100%; height:100%" align="center">
				<div style="width:90%; height:90%">
				<div class="layui-carousel" id="test1" lay-filter="test1">
                    <div carousel-item>
                       <div>欢迎使用血压标注系统</div>
                       <div>欢迎使用血压标注系统</div>
                       <div>欢迎使用血压标注系统</div>
                       <div>欢迎使用血压标注系统</div>
                       <div>欢迎使用血压标注系统</div>
                    </div>
                </div>
                </div>
                </div>
			</div>
		</div>
	</div>


  </div>

  <div class="layui-footer" align="center">
    <!-- 底部固定区域 -->
    <p>
    Copyright &copy;<script>document.write(new Date().getFullYear());</script> 版权归CVTE所有
    </p>
  </div>
</div>

<!-- 移动导航 -->
<div class="site-tree-mobile layui-hide">
  <i class="layui-icon">&#xe602;</i>
</div>
<div class="site-mobile-shade"></div>

<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/layui/hpTab.js"></script> --%>
<script type="text/javascript">
layui.use('layer', function(){
	  var layer = layui.layer;
	});
	
layui.use('carousel', function(){
	  var carousel = layui.carousel;
	  //建造实例
	  carousel.render({
	    elem: '#test1'
	    ,width: '100%' //设置容器宽度
	    ,height: '90%'
	    ,arrow: 'always' //始终显示箭头
	    //,anim: 'updown' //切换动画方式
	  });
	});
	
	
layui.use('element', function(){
	  var $ = layui.jquery
	  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
	  
	  //触发事件
	  var active = {
		tabAdd: function(id, title, href) {
			//新增一个Tab项
		    element.tabAdd('tabDemo', {
			    title: title,
			    content: '<iframe class="zn-iframe" style="width: 100%; height: 517px;"  src="' + href + '" />',
			    id: id //实际使用一般是规定好的id，这里以时间戳模拟下
		    })
		    element.tabChange('tabDemo', id); //切换到：当前tab
<%-- 			$.ajax({
				   type:'POST',
				   url:'<%=request.getContextPath()%>/login/checkTimeout.do',
				   dataType:'json',
				   success:function(data){
					   //alert(data.success);
					   if(data.success) {
						 
					     }else{
					        document.location = "<%=request.getContextPath()%>/views/login.jsp";
					     }
				   }
				}); --%>
		}
	    ,tabDelete: function(othis){
	        //删除指定Tab项
	        element.tabDelete('tabDemo', '44'); //删除：“44”
	    }
	    ,tabChange: function(id){
	        //切换到指定Tab项
	        element.tabChange('tabDemo', id); //切换到：22
	    }
	    /**
		 * 监听浏览器窗口改变事件
		 */
		,winResize: function() {
			$(window).on('resize', function() {
				var currBoxHeight = $('.layui-body').height(); //获取当前容器的高度
				$('.layui-tab-content iframe').height(currBoxHeight - 35);
			}).resize();
		}
	  };
	  
	  $('.site-demo-active').on('click', function(){
	    var othis = $(this), type = othis.data('type');
	    active[type] ? active[type].call(this, othis) : '';
	  });
	  
	  $('.zn-tab-add').on('click', function(){
		    //var othis = $(this), type = othis.data('type');
		    //active[type] ? active[type].call(this, othis) : '';
		    var othis = $(this);
			var href = othis.attr("zn-href");
			var title = othis.html();
			var zn_tab_id = othis.attr("zn-tab-id");
			if(zn_tab_id) {
				active.tabChange(zn_tab_id);
			} else {
				if(href == "/BloodSystem/label/blood"){
					//hideMenu();
				}
				zn_tab_id = new Date().getTime();
				othis.attr("zn-tab-id", zn_tab_id);
				othis.attr("id", "zn-tab-id-"+zn_tab_id);
				active.tabAdd(zn_tab_id, title, href);
			}
			active.winResize();
		  });
	  
	  $(".fsSwitchMenu").on("click",function(){
			if($(this).find("i.fa-outdent").length>0){
				$(this).find("i").removeClass("fa-outdent").addClass("fa-indent");
			}else{
				$(this).find("i").removeClass("fa-indent").addClass("fa-outdent");
			}
		 	$(".layui-layout-admin").toggleClass("showMenu");
		});
	  
	      //监听选项卡删除
		  element.on('tabDelete(tabDemo)', function(data) {
			  var id=$(this).parent().attr("lay-id");
			  $('#zn-tab-id-'+id).attr("zn-tab-id","");
		  });
	  
	  //Hash地址的定位
	  var layid = location.hash.replace(/^#test=/, '');
	  element.tabChange('test', layid);
	  
	  element.on('tab(test)', function(elem){
	    location.hash = 'test='+ $(this).attr('lay-id');
	  });
	  
	});
	
/* $(function() {
    initIndex();
}); */

function hideMenu(){
	   $(".fsSwitchMenu").find("i").removeClass("fa-outdent").addClass("fa-indent");
	 	$(".layui-layout-admin").toggleClass("showMenu");
}

    function logout(){
	    $.ajax({
		    type: "POST",
		    url: "<%=request.getContextPath()%>/login/reqLogout.do",
		    dataType: "json",
		    success: function(ms){
			    var value = ms.toString();
			    layer.msg('退出成功！！！！!!',{icon:6,time:4000});
			    window.location.href="<%=request.getContextPath()%>/views/login.jsp";
		    }
	    });
    }
	

/* layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
}); */
</script>
</body>
</html>
