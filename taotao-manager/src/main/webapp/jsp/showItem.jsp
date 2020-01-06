<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <title>layui在线调试</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/dist/css/layui.css?t=1575889601627" media="all">

</head>
<body>
  <div class="layui-input-block" style="margin-left:1px;float: left; position: relative;">
    <input style="width: 300px;" type="text" id="select_orderId" name="select_orderId" lay-verify="required" placeholder="请输入商品Id" autocomplete="off" class="layui-input">
  </div>
    <button class="layui-btn" lay-submit="" id="searchBtn" data-type="getInfo" style="float: left;">搜索</button>
	<div style="margin-top:50px"></div>
 
<table class="layui-hide" id="demo" lay-filter="test" lay-data="{id: 'idTest'}"></table>
<script type="text/html" id="roleTpl">
		{{# if (d.status=== 1) { }}   
  		正常
		{{# } else if (d.status=== 0){ }}
		下架
		{{# } else { }}  
  		已删除
		{{# } }}
</script>


<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="del" data-type="getCheckData">批量删除</button>
    <button class="layui-btn layui-btn-sm" lay-event="putOn" data-type="getCheckData">上架</button>
    <button class="layui-btn layui-btn-sm" lay-event="putOff" data-type="getCheckData">下架</button>
  </div>
</script>
 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
              
<script src="${pageContext.request.contextPath }/layui/dist/layui.js?t=1575889601627"></script>
<script>
layui.config({
  version: '1575889601627' //为了更新 js 缓存，可忽略
});
 
 
layui.use(['laypage', 'layer', 'table', 'element'], function(){
  var laydate = laypage = layui.laypage //分页
  ,layer = layui.layer //弹层
  ,table = layui.table //表格
  ,element = layui.element //元素操作
//第一个实例
  table.render({
    elem: '#demo'
    ,id: 'idTest'
    ,height: 'full-170'
    ,url: '/item/itemJson' //数据接口
    ,page: true //开启分页
    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
        ,defaultToolbar: ['filter', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
          title: '提示'
          ,layEvent: 'LAYTABLE_TIPS'
          ,icon: 'layui-icon-tips'
        }]
    ,parseData:function(res){
    	console.log(res);
    	return{
    		"code":0,
    		"msg":"",
    		"count":res.count,
    		data:res.itemAll
    	}
    }
    ,cols: [[ //表头
       {type: 'checkbox', fixed: 'left',style:'transform: translateY(+12%);'}
      ,{field: 'id', title: '商品ID', width:95, sort: true, fixed: 'left',style:'height:42px;'}
      ,{field: 'title', title: '商品标题', width:200}
      ,{field: 'sellPoint', title: '卖点', width:140} 
      ,{field: 'cid', title: '叶子类目', width:80, sort: true}
      ,{field: 'price', title: '价格', width: 90, sort: true}
      ,{field: 'num', title: '库存数量', width: 70, sort: true}
      ,{field: 'barcode', title: '条形码', width: 40}
      ,{field: 'status', title: '状态', width: 72, sort: true,templet: '#roleTpl'}
      ,{field: 'created', title: '创建日期', width: 160,templet: "<div>{{layui.util.toDateString(d.created, 'yyyy-MM-dd HH:mm:ss')}}</div>", sort: true}
      ,{field: 'updated', title: '更新日期', width: 160,templet: "<div>{{layui.util.toDateString(d.updated, 'yyyy-MM-dd HH:mm:ss')}}</div>", sort: true}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:120,style:'height:42px;'}
    ]]
  });
  
	//头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      
  	  //上架
      case 'putOn':
    	  var checkStatus = table.checkStatus('idTest');
  		if(checkStatus.data.length==0){
  			parent.layer.msg('请先选择要上架的数据行！', {icon: 2});
  			return ;
  		}
  		var ids = "";
  		for(var i=0;i<checkStatus.data.length;i++){
  			ids += checkStatus.data[i].id+",";
  		}
  		$.post('/item/itemDel',
  	            {'ids':ids,'op':'putOn'},
  	            function(code){
  			        layer.closeAll('loading');
  			        if(code!=0){
  				      parent.layer.msg('成功！', {icon: 1,time:700,shade:0.2});
  				      table.reload("idTest");
  			        }else{
  				        parent.layer.msg('失败！', {icon: 2,time:3000,shade:0.2});
  			        }
  		        }
  	    );
      break;
      
      //下架
      case 'putOff':
    	  var checkStatus = table.checkStatus('idTest');
    		if(checkStatus.data.length==0){
    			parent.layer.msg('请先选择要下架的数据行！', {icon: 2});
    			return ;
    		}
    		var ids = "";
    		for(var i=0;i<checkStatus.data.length;i++){
    			ids += checkStatus.data[i].id+",";
    		}
    		$.post('/item/itemDel',
    	            {'ids':ids,'op':'putOff'},
    	            function(code){
    			        layer.closeAll('loading');
    			        if(code!=0){
    				        parent.layer.msg('成功！', {icon: 1,time:700,shade:0.2});
    				        table.reload("idTest");
    			        }else{
    				        parent.layer.msg('失败！', {icon: 2,time:3000,shade:0.2});
    			        }
    		        }
    	    );
      break;
      
      //删除
      case 'del':
    	  var checkStatus = table.checkStatus('idTest');
    		if(checkStatus.data.length==0){
    			parent.layer.msg('请先选择要删除的数据行！', {icon: 2});
    			return ;
    		}
    		var ids = "";
    		for(var i=0;i<checkStatus.data.length;i++){
    			ids += checkStatus.data[i].id+",";
    		}
    		parent.layer.msg('删除中...', {icon: 16,shade: 0.3,time:4000});
    		$.post('/item/itemDel',
    	            {'ids':ids,'op':'del'},
    	            function(code){
    			        layer.closeAll('loading');
    			        if(code!=0){
    				        parent.layer.msg('删除成功！', {icon: 1,time:700,shade:0.2});
    				        table.reload("idTest");
    			        }else{
    				        parent.layer.msg('删除失败！', {icon: 2,time:3000,shade:0.2});
    			        }
    		        }
    	    );
      break;
      
      
      
      
      
      
    };
  });
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
  		var ids = data.id;
  		parent.layer.msg('删除中...', {icon: 16,shade: 0.3,time:4000});
  		$.post('/item/itemDel',
  	            {'ids':ids,'op':'del'},
  	            function(code){
  			        layer.closeAll('loading');
  			        if(code!=0){
  				        parent.layer.msg('删除成功！', {icon: 1,time:700,shade:0.2});
  				     	table.reload("idTest");
  			        }else{
  				        parent.layer.msg('删除失败！', {icon: 2,time:2000,shade:0.2});
  			        }
  		        }
  	    );
        //obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.prompt({
        formType: 2
        ,value: data.email
      }, function(value, index){
        obj.update({
          email: value
        });
        layer.close(index);
      });
    }
  });
  
  
  
  
  
  
  $('#searchBtn').on('click',function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	});
	// 点击获取数据
	var  active = {
	    getInfo: function () {
	        var orderId=$('#select_orderId').val();
	        if (orderId) {
	            //var index = layer.msg('查询中，请稍候...',{icon: 16,time:false,shade:0});
	            setTimeout(function(){
	                table.reload('idTest', { //表格的id
	                    url:'/item/itemId',
	                    where: {
	                        'itemId':$.trim(orderId)
	                    }
	                });
	                layer.close(index);
	            },800);
	        } else {
	            layer.msg("请输入编号");
	        }
	    },
	};
	//监听回车事件,扫描枪一扫描或者按下回车键就直接执行查询
	$("#select_orderId").bind("keyup", function (e) {
	    if (e.keyCode == 13) {
	        var type = "getInfo";
	        active[type] ? active[type].call(this) : '';
	    }
	});

});

</script>
</body>
</html>