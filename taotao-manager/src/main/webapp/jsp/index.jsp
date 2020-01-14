<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>淘淘商城后台</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/layui/css/layui.css">
<style type="text/css">
a {
	color: #009688;
}

a:visited {
	text-decoration: none;
}

a:hover {
	color: #48D1CC;
}
body {
	background-color: #F2F2F2;
}

.layui-layout-admin .layui-body {
	bottom: 0
}
.layui-badge.layuiadmin-badge{
	float:right;
	margin-top: 11px;
}
.layui-card-header{
	height: 40px;
}
.layui-card-body .layuiadmin-card-list{
	height: 90px;
}
p.layuiadmin-big-font{
	font-size:33px;
	color:#666666;
	padding-top:20px;
	padding-bottom:20px;
}
p{
	color:#666666;
}
.layuiadmin-span-color{
	float:right;
}
.layui-inline.layui-icon.layui-icon-flag{
	float:right;
}
.layui-card{
	background-color: #FFFFFF;
}



</style>
</head>
<body class="layui-layout-body close-footer">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">
				<a href="${pageContext.request.contextPath }">淘淘商城后台</a>
			</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->

			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> admin
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">个人中心</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">注销</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a class="" href="javascript:;">商品管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a id="addItemCat" href="javascript:;">商品分类添加</a>
							</dd>
							<dd>
								<a href="javascript:;">商品分类查询</a>
							</dd>
							<dd>
								<a id="addItem" href="javascript:;">商品添加</a>
							</dd>
							<dd>
								<a id="showItem" href="javascript:;">商品查询</a>
							</dd>
							<dd>
								<a href="javascript:;">商品规格参数模板添加</a>
							</dd>
							<dd>
								<a href="javascript:;">商品规格参数模板查询</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">cms内容管理系统</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">cms内容模板添加</a>
							</dd>
							<dd>
								<a href="javascript:;">cms内容模板查询</a>
							</dd>
							<dd>
								<a href="javascript:;">cms内容添加</a>
							</dd>
							<dd>
								<a href="javascript:;">cms内容查询</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">订单管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">查询订单</a>
							</dd>
							<dd>
								<a href="javascript:;">订单统计</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">用户管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">查询用户</a>
							</dd>
							<dd>
								<a href="javascript:;">用户统计</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">权限管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">查看权限</a>
							</dd>
							<dd>
								<a href="javascript:;">分配权限</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">活动管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">新增活动</a>
							</dd>
							<dd>
								<a href="javascript:;">查看活动</a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">

			<!-- 内容主体区域
				 $("#content").load("/jsp/showItem.jsp");
			 -->
			 
			<div id="content" style="padding: 15px;">


			<div class="layui-row layui-col-space15" style="">
				<div class="layui-col-sm6 layui-col-md3">
					<div class="layui-card">
						<div class="layui-card-header">
							访问量 <span class="layui-badge layui-bg-blue layuiadmin-badge">周</span>
						</div>
						<div class="layui-card-body layuiadmin-card-list">
							<p class="layuiadmin-big-font">9,999,666</p>
							<p>
								总计访问量 <span class="layuiadmin-span-color">88万 <i
									class="layui-inline layui-icon layui-icon-flag"></i></span>
							</p>
						</div>
					</div>
				</div>
				<div class="layui-col-sm6 layui-col-md3">
					<div class="layui-card">
						<div class="layui-card-header">
							下载 <span class="layui-badge layui-bg-cyan layuiadmin-badge">月</span>
						</div>
						<div class="layui-card-body layuiadmin-card-list">
							<p class="layuiadmin-big-font">33,555</p>
							<p>
								新下载 <span class="layuiadmin-span-color">10% <i
									class="layui-inline layui-icon layui-icon-face-smile-b"></i></span>
							</p>
						</div>
					</div>
				</div>
				<div class="layui-col-sm6 layui-col-md3">
					<div class="layui-card">
						<div class="layui-card-header">
							收入 <span class="layui-badge layui-bg-green layuiadmin-badge">年</span>
						</div>
						<div class="layui-card-body layuiadmin-card-list">

							<p class="layuiadmin-big-font">999,666</p>
							<p>
								总收入 <span class="layuiadmin-span-color">*** <i
									class="layui-inline layui-icon layui-icon-dollar"></i></span>
							</p>
						</div>
					</div>
				</div>
				<div class="layui-col-sm6 layui-col-md3">
					<div class="layui-card">
						<div class="layui-card-header">
							活跃用户 <span class="layui-badge layui-bg-orange layuiadmin-badge">月</span>
						</div>
						<div class="layui-card-body layuiadmin-card-list">

							<p class="layuiadmin-big-font">66,666</p>
							<p>
								最近一个月 <span class="layuiadmin-span-color">15% <i
									class="layui-inline layui-icon layui-icon-user"></i></span>
							</p>
						</div>
					</div>
				</div>
			</div>







			<div class="layui-row layui-col-space15">
			
				<div class="layui-col-sm12 layui-col-md6" style="margin-top: 0px;">
					<div class="layui-card" style="">
						<div class="layui-card-header">近7天用户注册量</div>
						<div style=" margin-top: 10px;" class="layui-card-body">
							<div id="echart2" style="height: 400%;"></div>
						</div>
					</div>
				</div>
				
				<div class="layui-col-sm12 layui-col-md6">				
					<div class="layui-card" style="">
					<div class="layui-card-header">商品分类</div>
						<div style=" margin-top: 10px;" class="layui-card-body">
							<div id="echart1" style="height: 400%;"></div>
						</div>
					</div>
				</div>
			</div>
				
			</div>

		</div>
		<!-- 
			<div class="layui-footer" style="">
				//底部固定区域
				© 欢迎来到淘淘商城后台管理系统
			</div>
		 -->
	</div>
	<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
	<script
		src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/echarts-en.common.min.js"></script>

	<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
$("#showItem").click(function(){
	 $("#content").load("/jsp/showItem.jsp");
})
$("#addItemCat").click(function(){
	$("#content").load("/jsp/addItemCat.jsp");
})
$("#addItem").click(function(){
	$("#content").load("/jsp/addItem.jsp");
})



/*
	echart
*/
$(function(){
	
	var myChart = echarts.init(document.getElementById('echart1'));
	$.get('/item/echart1').done(function (data) {
	    myChart.setOption({

	        tooltip: {
	            trigger: 'item',
	            formatter: '{b} : {d}%'
	        },
	        
	        series:data.series
	        
	    });
	});
	
	var myChart2 = echarts.init(document.getElementById('echart2'));
	$.get('/item/echart2').done(function (data) {
	    myChart2.setOption({
	    	xAxis:data.xAxis,
	    	yAxis:data.yAxis,
	        tooltip: {
	            trigger: 'item',
	            formatter: '{c}'
	        },
	        series:data.series
	    });
	});
	
})

</script>
</body>
</html>