<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <%@ include file="/layui/header.jsp"%>
   <title>标注列表</title>
   <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <%-- <script src="<%=request.getContextPath()%>/layui/jquery-1.8.2.min.js"></script> --%>
   <script type="text/javascript" defer="defer">
   var heigh5;
   $(function(){
	   init();
	   var heigh = document.body.scrollHeight || document.documentElement.scrollHeight;
		var heigh1 = document.body.clientHeight;
		var heigh2 = document.body.offsetHeight || document.documentElement.offsetHeight;
		var heigh3 = document.documentElement.clientHeight || document.body.clientHeight;
		var heigh4 = document.body.scrollTop || document.documentElement.scrollTop;
		heigh5 = heigh - heigh2 - 10;
   });
   
      function init(){
    	  layui.use('layer', function(){
    		  var layer = layui.layer;
    		});
    	  
    	  layui.use('laydate', function(){
    		  var laydate = layui.laydate;
    		  //执行一个laydate实例
    		  laydate.render({
    		    elem: '#dateTime' //指定元素
    		    ,range: true
    		  });
    		});
    	  
		  
    	   var userName = $("#user").val();
		  
   	       //名称
		   var fileName = $("#fileName").val();
		   
		   //时间
		   var dateTime = $("#dateTime").val();
    	  
    	  layui.use('table', function(){
    		  var table = layui.table;
    		  table.render({
    		    elem: '#table1'
    		    ,id: 'flagTwo'
    		    ,url:'<%=request.getContextPath()%>/list/searchFile.do'
    		    ,height: heigh5
    		    //,cellMinWidth: 120
    		    ,limits:[10,25,50,75,100]
    		    ,cols: [[
    		      //{field:'id', width:'1%'}
    		      {checkbox: true, event: 'set1', fixed: true}
    		      ,{field:'fileId',width : '8%', event: 'set1', title: 'ID', fixed: true, sort: true}
    		      ,{field:'fileName',width : '20%', event: 'set2', title: '文件名', fixed: true, sort: true}
    		      ,{field:'statusId',width : '10%', event: 'set3', title: '标注状态', sort: true
    		    	  ,templet: function(d){
    		    		  var state = d.statusId;
    		    		  if(state == 1){
    		    			  return '<span style="color: #FF6347;">' + '未标注' + '</span>';
    		    		  }else if(state == 2){
    		    			  return '<span style="color: #90EE90;">' + '标注中' + '</span>';
    		    		  }
    		    	  }
    		      }
    		      ,{field:'labelName',width : '20%', event: 'set4', title: '标注人员', sort: true
    		    	  ,templet: function(d){
    		    		  var labelname = d.labelName;
    		    		  if(labelname == ''){
    		    			  return '<span style="color: #FF6347;">' + '无' + '</span>';
    		    		  }else if(state == 1){
    		    			  return '<span style="color: #90EE90;">' + labelname + '</span>';
    		    		  }
    		    	  }
    		      }
    		      ,{field:'labelTime',width : '30%', event: 'set5', title: '最后标注时间', sort: true
    		    	  ,templet: function(d){
    		    		  var ltm = d.labelTime;
    		    		  if(ltm == null || ltm == ''){
    		    			  return '未进行标注';
    		    		  }else{
    		    			  var date = new Date(ltm);
    		    			  var Y = date.getFullYear() + '-';
        		    		  var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        		    		  var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
        		    		  var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
        		    		  var m = (date.getMinutes() <10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
        		    		  var s = (date.getSeconds() <10 ? '0' + date.getSeconds() : date.getSeconds());
        		    		  return Y+M+D+h+m+s;
    		    		  }
    		    	  }
    		      }
    		      ,{fixed: 'right', width : '9%', event: 'set6', title: '操作', align:'center', toolbar: '#barDemo'}
    		    ]]
    		    ,page: true
    		    ,where: {"userName": userName, "fileName": fileName, "dateTime":dateTime}
    		    ,done: function(res, curr, count){
    		    	  //changeBg();
    		      }
    		  });
    		  
    		  table.on('tool(tableEvent)', function(obj){
    			  var tmpdata = obj.data;
    			  var fileName = tmpdata.fileName;
    			  var lname = tmpdata.labelName;
    			  var ltime = tmpdata.labelTime;
    			  if(obj.event === 'fileView'){
    				  //hideMenu();
    				  document.location = "<%=request.getContextPath()%>/label/readyLabel?fileName=" + fileName + "&&labelName=" + lname + "&&labelTime=" + ltime;
    			  }else if(obj.event == "md5"){
    				  layer.open({
    					  title: 'MD5'
    					  ,content: md5
    					});
    			  }
    		  });
    		});
      }
      
      function hideMenu(){
   	   $(".fsSwitchMenu").find("i").removeClass("fa-outdent").addClass("fa-indent");
   	 	$(".layui-layout-admin").toggleClass("showMenu");
      }
      
   </script>
   
</head>
<body>
  <input type="hidden" id="videoView" value="">
  <div style="width: 100%; height:100%; float: left">
	<div class="layui-fluid">
		<div class="layui-row layui-col-space1">
			<div class="layui-col-md12">
				<div class="layui-form-query">
					<form class="layui-form" id="query_form">
						<div class="layui-form-item">
							<div class="layui-inline" id="tName">
								<label class="layui-form-mid">用户名：</label>
								<div class="layui-input-inline"
									style="width: 140px; height: 35px;">
									<select name="user" id="user" lay-verify="required" lay-search="" style="width: 140px; height: 35px;">
										<option value="">直接选择或搜索</option>
										<c:forEach items="${users}" var = "user" varStatus = "status">
                                        <option value="${user.account}">${user.account}</option>
                                        </c:forEach>
									</select>
								</div>
							</div>
							
							<div class="layui-inline">
								<label class="layui-form-mid">文件名：</label>
								<div class="layui-input-inline"
									style="width: 100px; height: 35px;">
									<input type="tel" id="fileName" name="fileName" autocomplete="off"
										style="width: 120px; height: 35px;" placeholder="标注文件名"
										class="layui-input input-text" />
								</div>
							</div>
							
							<!-- <div class="layui-inline">
								<label class="layui-form-mid">状态：</label>
								<div class="layui-input-inline"
									style="width: 90px; height: 35px;">
									<select id="statusId" name="statusId" style="width: 150px; height: 35px;">
										<option value="">请选择</option>
										<option value="1">未标注</option>
										<option value="2">标注中</option>
									</select>
								</div>
							</div> -->
							
							<div class="layui-inline">
			                    <label class="layui-form-mid">标注日期范围：</label>
			                    <div class="layui-inline" style="">
				                    <input type="text" id="dateTime" name="dateTime" autocomplete="off" style="width: 170px; height: 36px;" class="layui-input fsDate" dateRange="1" placeholder=" - "/>
			                    </div>
		                    </div>
							
							<div class="layui-inline">
								<div class="layui-inline">
									<button class="layui-btn" type="button" function="query" onclick="init()">
										<i class="layui-icon">&#xe615;</i>查询
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			
		 <div class="layui-col-md12">
            <table class="layui-table" id="table1" lay-filter="tableEvent"></table>
			<!-- <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="top" topUrl="views/datagrid2/one.html" topMode="readonly" topWidth="800px" topHeight="600px" topTitle="查看demo" inputs="id:">查看</a> -->
			<script type="text/html" id="barDemo">
 				<a class="layui-btn layui-btn-sm" lay-event="fileView" >查看</a>
			</script>
	      </div>
			
		</div>
	</div>
  </div>
	<script type="text/javascript">
	layui.use('form', function(){
		  var form = layui.form;
		});
	</script>
</body>
</html>