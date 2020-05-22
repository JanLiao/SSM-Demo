<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/js/public/contextMenu/jquery.contextMenu.css" />
<title>Insert title here</title>
</head>
<body onload="init()">
    <div style="height:5%;">&nbsp;</div>
	<div id="ware" align="center"></div>
	<div id="contextmenu-output"></div>
</body>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/echarts-all-jan.js"></script>
	<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/macarons.js"></script> --%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/public/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/public/contextMenu/jquery.ui.position.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/public/contextMenu/jquery.contextMenu.js"></script>
<script type="text/javascript">
    var wareContainer;
	var myChart;
	var option;
	var dataZoom_start = 20;
	var dataZoom_start_old = 5;
	var dataZoom_end = 70;
	var dataZoom_end_old = 70;

	var mark_point_color = ''; // 标注点颜色

	var mark_point_map = new Map();
	
	var client_start_x;
	var client_start_y;

	function init() {
		var theme = "macarons";
		wareContainer = document.getElementById('ware');
		
		//用于使chart自适应高度和宽度,通过窗体高宽计算容器高宽
		var resizeWare = function() {
			wareContainer.style.width = window.innerWidth * 0.95 + 'px';
			wareContainer.style.height = window.innerHeight * 0.88 + 'px';
		};
		//设置容器高宽
		resizeWare();
		myChart = echarts.init(document.getElementById("ware"), theme);
		option = {
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataZoom : {
						show : true
					},
					dataView : {
						show : true
					},
					magicType : {
						show : true,
						type : [ 'line', 'bar', 'stack', 'tiled' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : false,
			dataZoom : {
				show : true,
				realtime : true,
				start : 20,
				end : 40
			},
			xAxis : [ {
				type : 'category',
				boundaryGap : false,
				data : function() {
					var list = [];
					for (var i = 1; i <= 300; i++) {
						list.push(i);
					}
					return list;
				}()
			} ],
			yAxis : [ {
				type : 'value'
			} ],
			series : [  {
	            name:'邮件营销',
	            type:'line',
	            stack: '总量',
	            data : function() {
					var list = [];
					for (var i = 1; i <= 300; i++) {
						list.push(Math.round(i));
					}
					return list;
				}()
	        },
	        {
	            name:'联盟广告',
	            type:'line',
	            stack: '总量',
	            data : function() {
					var list = [];
					for (var i = 1; i <= 300; i++) {
						list.push(Math.round(i));
					}
					return list;
				}()
	        },
	        {
	            name:'视频广告',
	            type:'line',
	            stack: '总量',
	            data : function() {
					var list = [];
					for (var i = 1; i <= 300; i++) {
						list.push(Math.round(i));
					}
					return list;
				}()
	        },
	        {
	            name:'直接访问',
	            type:'line',
	            stack: '总量',
	            data : function() {
					var list = [];
					for (var i = 1; i <= 300; i++) {
						list.push(Math.round(i));
					}
					return list;
				}()
	        },
	        {
	            name:'搜索引擎',
	            type:'line',
	            stack:'总量',
	            data : function() {
					var list = [];
					for (var i = 1; i <= 300; i++) {
						list.push(Math.round(i));
					}
					return list;
				}()
	        }]
		};
		
		document.oncontextmenu = function () { return false; }; 
		myChart.on('contextmenu', function (param) {
		    console.log("右键事件");
		    console.log(param);
		    
		    // 显示自定义菜单
		    $.contextMenu({
		          selector: '#contextmenu-output',
		          trigger: 'none',
		          build: function($trigger, e) {
		              //构建菜单项build方法在每次右键点击会执行
		              return {
		                  callback: contextMenuClick,
		                  items: contextMenuItems
		              };
		          }
		    });
	    	showContextMenu();
		});
		/* var ecConfig = echarts.config;
		myChart.on(ecConfig.EVENT.CONTEXTMENU, showMenu);
		function showMenu(param){
			console.log('433333333');
		    console.log('param===',param);
		} */

		myChart.on('click', function(param) {
			console.log(checkPoint(param));
			// 判断该点是否存在
			if(checkPoint(param)){
				return false;
			}
			
			//console.log(param);
			console.log('seriesName = ' + param.seriesName); //legend的名称
			console.log('name = ' + param.name); //X轴的值
			console.log('data = ' + param.data);
			console.log('value = ' + param.value);
			console.log('seriesIndex = ' + param.seriesIndex);
			console.log('dataIndex = ' + param.dataIndex);
			console.log('dataZoom = ' + option.dataZoom.start);
			console.log('data size = ' + option.series[0].data.length);
			//var relativeX = parseInt(option.series[0].data.length * dataZoom_start / 100);
			var mp = {
				symbol : 'emptyCircle',
				itemStyle : {
					normal : {
						label : {
							position : 'top'
						}
					}
				},
				data : [ {
					name : param.seriesName,
					value : param.data,
					xAxis : (param.dataIndex - parseInt(option.series[0].data.length * dataZoom_start / 100)),
					yAxis : param.data,
					symbolSize : 10
				} ]
			};
			
			// 原始数据保存
			var mp_origin = {
				symbol : 'emptyCircle',
				itemStyle : {
					normal : {
						label : {
							position : 'top'
						}
					}
				},
				data : [ {
					name : param.seriesName,
					value : param.data,
					xAxis : param.dataIndex,
					yAxis : param.data,
					symbolSize : 10
				} ]
			};

			// 添加原始数据
			mark_point_map.set(mp_origin, param.seriesIndex);

			// 添加所有click的MarkPoint
			myChart.addMarkPoint(param.seriesIndex, mp);
		});

		myChart.on('dataZoom', function(param) {
			dataZoom_start = param.zoom.start;
			dataZoom_end = param.zoom.end;
			
			// 同时更新dataZoom的start和end
			option.dataZoom.start = dataZoom_start;
			option.dataZoom.end = dataZoom_end;
			//option.animation = false;
			//myChart.clear();
			//myChart.setOption(option);
			
			//console.log(param);
			//console.log('param start = ' + param.zoom.start + ',' + param.zoom.end);
			if ((dataZoom_start != dataZoom_start_old) || (dataZoom_end != dataZoom_end_old)) {
				deleteMarkPoint();
			}
			
			if (dataZoom_start != dataZoom_start_old || (dataZoom_end != dataZoom_end_old)) {
				refreshMarkPoint();
				dataZoom_start_old = dataZoom_start;
			}
		});

		myChart.setOption(option);

		/*监听鼠标滚动事件
		 * 1.火狐的是：DOMMouseScroll;
		 * 2.IE/Opera/Chrome：直接添加事件*/
		/* if (document.addEventListener) {
			document.addEventListener('DOMMouseScroll', scrollFunc, false);
			document.addEventListener('mousedown', mouseDown, false);
			document.addEventListener('mouseup', mouseUp, false);
		}//W3C
		window.onmousewheel = document.onmousewheel = scrollFunc;//IE/Opera/Chrome
		window.onmousedown = document.onmousedown = mouseDown;
		window.onmouseup = document.onmouseup = mouseUp; */
		
		if(wareContainer.addEventListener){
			wareContainer.addEventListener('DOMMouseScroll', scrollFunc, false);
			wareContainer.addEventListener('mousedown', mouseDown, false);
			wareContainer.addEventListener('mouseup', mouseUp, false);
			//wareContainer.addEventListener('mousemove', mouseMove, false);
		}
		wareContainer.onmousewheel = scrollFunc;//IE/Opera/Chrome
		wareContainer.onmousedown = mouseDown;
		wareContainer.onmouseup = mouseUp;
		//wareContainer.mousemove = mouseMove;

		/* var el = window.document.body;//声明一个变量，默认值为body
		window.document.body.onmouseover = function(event){
		  el = event.target;//鼠标每经过一个元素，就把该元素赋值给变量el
		  console.log('当前鼠标在', el, '元素上');//在控制台中打印该变量
		} */

		// 定时执行  测试
		//showLogin();
	}
	
	function checkPoint(param){
		var flag = false;
		console.log(mark_point_map);
		for(var key in mark_point_map){
			//var seriesValue = mark_point_map[key];
			var mpp = key;
			//var value = mark_point_map[mpp];
			console.log(mpp);
		}
		return flag;
	}
	
	function mouseMove(){
		var oevent = event;
		console.log(oevent.clientX + ',' + oevent.clientY + ',');
		if(client_start_x == -1 || client_start_y == -1){
			
		}else{
			var oevent = event;
			var offset_x = oevent.clientX - client_start_x;
			var offset_y = oevent.clientY - client_start_y;
			console.log(oevent.clientX + ',' + oevent.clientY + ',' + offset_x + ',' + offset_y);
			var mm_ratio = offset_x / 1000;
			dragRun(mm_ratio);

			// mouse up时判断dataZoom的start是否change,changed repaint markpoint
			if (dataZoom_start != dataZoom_start_old) {
				//console.log('not equal');
				refreshMarkPoint();
				dataZoom_start_old = dataZoom_start;
			}
			if(dataZoom_end != dataZoom_end_old){
				refreshMarkPoint();
				dataZoom_end_old = dataZoom_end;
			}
		}
	}

	function mouseDown() {
		//var btnIdx = event.button;
		var cursorstyle = document.getElementById('ware').style.cursor;//获取鼠标的样式，可以赋值
		if (cursorstyle == 'move') {
			//console.log('mouse down-----' + cursorstyle);
			client_start_x = -1;
			client_start_y = -1;
		} else if (cursorstyle == 'default') {
			setStartXY();
		} else if (cursorstyle == 'pointer') { // click在mouse down and up之后
			setStartXY();
		}
	}
	
	function setStartXY(){
		var oevent = event;
		client_start_x = oevent.clientX;
		client_start_y = oevent.clientY;
		console.log(client_start_x + ',' + client_start_y);
		
		if(wareContainer.addEventListener){
			wareContainer.addEventListener('mousemove', mouseMove, false);
		}
		wareContainer.mousemove = mouseMove;
	}
	
	function showContextMenu() {
		contextMenuItems = {
			"delete" : {
				name : "删除",
				icon : "delete",
				data : ''
			},
			"add1" : {
				name : "添加视盘",
				icon : "update",
				data : ''
			},
			"add2" : {
				name : "添加视杯",
				icon : "add",
				data : ''
			},
			"add3" : {
				name : "标记黄斑中心",
				icon : "add",
				data : ''
			},
		};

		//右键菜单显示位置
		mouse_position = {
			x : event.clientX,
			y : event.clientY
		};
		//console.log(mouse_position);
		$("#contextmenu-output").contextMenu(mouse_position);
	}
	
	//右键菜单项点击
	function contextMenuClick(key, options) {
		
	}

	function mouseUp() {
		console.log('mouse up ---------');
		if(wareContainer.removeEventListener){
			wareContainer.removeEventListener('mousemove', mouseMove, false);
		}
		wareContainer.mousemove = null;
	}

	function deleteMarkPoint() {
		mark_point_map.forEach(function(value, key, map) {
			var mp1 = key;
			var seriesIndex = value;
			myChart.delMarkPoint(seriesIndex, key.data[0].name);
		});
	}

	function refreshMarkPoint() {
		//console.log(mark_point_map);

		var tmpMap = new Map();
		mark_point_map.forEach(function(value, key, map) {
			var mp1 = key;
			var seriesIndex = value;

			var mp_tmp = {
				symbol : 'emptyCircle',
				itemStyle : {
					normal : {
						label : {
							position : 'top'
						}
					}
				},
				data : [ {
					name : mp1.data[0]['name'],
					value : mp1.data[0]['value'],
					xAxis : mp1.data[0]['xAxis'],
					yAxis : mp1.data[0]['yAxis'],
					symbolSize : 10
				} ]
			};

			tmpMap.set(mp_tmp, seriesIndex);
			/* var sst = parseInt(option.series[0].data.length * dataZoom_start / 100);
			var dataIdx;
			if(sst == 0){  // 哎
				dataIdx = mp1.data[0]['xAxis'] - 0;
			}else{
				dataIdx = mp1.data[0]['xAxis'] - sst;
			} */
			var dataIdx = mp1.data[0]['xAxis'] - parseInt(option.series[0].data.length * dataZoom_start / 100);
			var endIdx = parseInt(option.series[0].data.length * dataZoom_end / 100);
			//console.log('point = ' + mp1.data[0]['xAxis'] + ',' + endIdx)
			if (dataIdx >= 0 && (mp1.data[0]['xAxis']) < (endIdx + 1)) {  // 不能小于或者等于endIdx(要多一个单位)
				mp1.data[0]['xAxis'] = dataIdx;
				myChart.addMarkPoint(seriesIndex, mp1);
			}
		});
		mark_point_map = tmpMap;

		//console.log(mark_point_map);
	}

	function showLogin() {
		//setInterval("timeRun()", "5000");
		//setTimeout("timeRun()", "5000");
	}
	
	// 鼠标拖拽
	function dragRun(moveRatio) {
		if(moveRatio > 0){
			if((option.dataZoom.start - moveRatio) < 0){
				var cur_offset = option.dataZoom.start;
				option.dataZoom.end -= cur_offset;
				option.dataZoom.start = 0;
			}else{
				option.dataZoom.start -= moveRatio;
				option.dataZoom.end -= moveRatio;
			}
		}else{
			if((option.dataZoom.end - moveRatio) > 100){
				var cur_offset = 100 - option.dataZoom.end;
				option.dataZoom.start += cur_offset;
				option.dataZoom.end = 100;
			}else{
				option.dataZoom.start -= moveRatio;
				option.dataZoom.end -= moveRatio;
			}
		}
		
		option.animation = false;
		myChart.clear();
		myChart.setOption(option);
		
		dataZoom_start = option.dataZoom.start;
		dataZoom_end = option.dataZoom.end;
		if (dataZoom_start != dataZoom_start_old) {
			deleteMarkPoint();
		}
		if (dataZoom_start != dataZoom_start_old) {
			//console.log('not equal');
			refreshMarkPoint();
			dataZoom_start_old = dataZoom_start;
		}
	}

	function timeRun(scrollRatio) {
		//console.log('定时执行=======' + option.dataZoom.start + '==' + option.dataZoom.end);
		//myChart.getOption().dataZoom.start += 5;
		//var start = option.dataZoom.start;
		//var end = option.dataZoom.end;
		if(option.dataZoom.start < option.dataZoom.end){
			if(scrollRatio > 0){
				option.dataZoom.start += scrollRatio;
				option.dataZoom.end -= scrollRatio;
			}else{
				if(option.dataZoom.start < 0.2){
					option.dataZoom.start = 0;
				}else{
					if(option.dataZoom.start > 0 && option.dataZoom.start < 100){
						option.dataZoom.start += scrollRatio;
					}else{
						if(option.dataZoom.start <= 0){
							option.dataZoom.start = 0;
						}
					}
				}
			}
			if(option.dataZoom.end > 0 && option.dataZoom.end <100){
				option.dataZoom.end -= scrollRatio;
			}else{
				if(option.dataZoom.end >= 100){
					option.dataZoom.end = 100;
				}
			}
		}else{
			option.dataZoom.start = option.dataZoom.end - 0.5;
		}
		
		option.animation = false;
		myChart.clear();
		myChart.setOption(option);
		
		dataZoom_start = option.dataZoom.start;
		dataZoom_end = option.dataZoom.end;
		if (dataZoom_start != dataZoom_start_old) {
			deleteMarkPoint();
		}
		if (dataZoom_start != dataZoom_start_old) {
			//console.log('not equal');
			refreshMarkPoint();
			dataZoom_start_old = dataZoom_start;
		}
	}

	var zoom_ratio = 1;
	var scrollFunc = function(e) {
		e = e || window.event;
		if (e.wheelDelta) {//IE/Opera/Chrome
			//自定义事件：编写具体的实现逻辑
			mouseScroll(e.wheelDelta);
		} else if (e.detail) {//Firefox
			//自定义事件：编写具体的实现逻辑
			mouseScroll(e.detail);
		}
	}

	function mouseScroll(zoomDelta) {
		var scrollRatio;
		if (zoomDelta == 120 || zoomDelta == -120) {
			zoom_ratio += (zoomDelta / 120) * 0.1;
			scrollRatio = (zoomDelta / 120) * 0.2;
		} else if (zoomDelta == 300 || zoomDelta == -300) { // firfox居然相反
			zoom_ratio = zoom_ratio + (zoomDelta / 300) * 0.1;
			scrollRatio = (zoomDelta / 300) * 0.2;
		} else if (zoomDelta == 3 || zoomDelta == -3) { // firfox居然相反
			zoom_ratio -= (zoomDelta / 3) * 0.1;
			scrollRatio = -(zoomDelta / 3) * 0.2;
		} else {
			//console.log('zoomDelta = ' + zoomDelta);
			var abs = Math.abs(zoomDelta);
			zoom_ratio += (zoomDelta / (abs * 2)) * 0.1;
			scrollRatio = (zoomDelta / (abs * 2)) * 0.2;
		}

		if (zoom_ratio < 0.11) {
			zoom_ratio = 0.1;
		}
		//console.log(zoom_ratio + ',' + scrollRatio);
		timeRun(scrollRatio);
	}
</script>
</html>