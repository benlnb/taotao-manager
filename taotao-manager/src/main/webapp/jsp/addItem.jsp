<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.ztree.core.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.ztree.excheck.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.ztree.exedit.min.js"></script>
</head>
<body>

	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend class="layui-anim layui-anim-scale">商品添加</legend>
	</fieldset>

	<form class="layui-form" action="" lay-filter="example">

		<div class="layui-form-item" id="layerDemo">
			<label class="layui-form-label">商品分类</label>
			<button id="divId1" style="margin-right: 10px; float: left;"
				type="button" data-method="offset" data-type="auto"
				class="layui-btn layui-btn-primary layui-btn-radius">选择分类</button>
			<input style="display: none;" type="text" id="cid" name="cid"
				lay-verify="required" autocomplete="on" placeholder="请输入商品标题"
				class="layui-input">
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">商品标题</label>
			<div class="layui-input-block">
				<input type="text" name="title" lay-verify="required"
					autocomplete="off" placeholder="请输入商品标题" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">卖点</label>
			<div class="layui-input-block">
				<input type="text" name="sellPoint" lay-verify="required"
					autocomplete="off" placeholder="请输入卖点" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">价格</label>
			<div class="layui-input-block">
				<input type="text" name="price" lay-verify="required|number"
					autocomplete="off" placeholder="请输入价格" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">库存数量</label>
			<div class="layui-input-block">
				<input type="text" name="num" lay-verify="required|number"
					autocomplete="off" placeholder="请输入库存数量" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">条形码</label>
			<div class="layui-input-block">
				<input type="text" name="barcode" lay-verify="required"
					autocomplete="off" placeholder="请输入条形码" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">图片</label>
			<div class="layui-input-block">
				<input type="text" name="image" lay-verify="required"
					autocomplete="off" placeholder="请输入标题" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">商品描述</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入商品描述" class="layui-textarea"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn" lay-submit=""
					lay-filter="example1">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

	<script>
		layui.use([ 'form' ], function() {
			var form = layui.form;
			//监听提交
			form.on('submit(example1)', function(data) {

				$.ajax({
					url : '/item/addItem',
					async: false,
	     			type:"POST",
	      			dataType: "text",
					data : data.field,
					success : function(data) {
						layer.msg("提交成功");
						$("#content").load("/jsp/addItem.jsp");
					},
					error : function(data) {
						layer.msg("提交失败");
						//$("#content").load("/jsp/addItem.jsp");
					}
				});
			return false;
			});
		});

		layui.use('layer', function() { //独立版的layer无需执行这一句
			var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

			//触发事件
			var active = {
				offset : function(othis) {
					var type = othis.data('type'), text = othis.text();

					layer.open({
						type : 1,
						area : [ '300px', '460px' ],
						title : '商品分类',
						offset : type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
						,
						id : 'layerDemo' + type //防止重复弹出
						,
						content : $('#hiddenZtree'),
						btnAlign : 'c' //按钮居中
						,
						shade : 0 //不显示遮罩
						,
						yes : function() {
							layer.closeAll();
						}
					});
				}
			};

			$('#layerDemo .layui-btn').on('click', function() {
				var othis = $(this), method = othis.data('method');
				active[method] ? active[method].call(this, othis) : '';
			});

		});

		/*
		 zTree
		 */

		var setting = {
			async : {
				enable : true,
				url : '/item/catZtree'
			},
			data : {
				simpleData : {
					enable : true,
					idKey : "id",
					pIdKey : "parentId",
					rootPId : 0
				}
			},
			callback : {
				onClick : zTreeOnClick,
			//beforeExpand: beforeExpand,
			//onAsyncSuccess: onAsyncSuccess,
			//onAsyncError: onAsyncError
			}
		};

		/*
			分类树： 点击节点
		 */
		function zTreeOnClick(event, treeId, treeNode) {
			if (!treeNode.isParent) {
				$('#divId1').html(treeNode.name);
				$("#cid").attr("value", treeNode.id);
				layer.closeAll();
			}
		};

		/*
		var log, className = "dark",
		startTime = 0, endTime = 0, perCount = 100, perTime = 100;
		
		function beforeExpand(treeId, treeNode) {
			if (!treeNode.isAjaxing) {
				startTime = new Date();
				treeNode.times = 1;
				ajaxGetNodes(treeNode, "refresh");
				return true;
			} else {
				alert("zTree 正在下载数据中，请稍后展开节点。。。");
				return false;
			}
		}
		function onAsyncSuccess(event, treeId, treeNode, msg) {
			if (!msg || msg.length == 0) {
				return;
			}
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			totalCount = treeNode.count;
			if (treeNode.children.length < totalCount) {
				setTimeout(function() {ajaxGetNodes(treeNode);}, perTime);
			} else {
				treeNode.icon = "";
				zTree.updateNode(treeNode);
				zTree.selectNode(treeNode.children[0]);
				endTime = new Date();
				var usedTime = (endTime.getTime() - startTime.getTime())/1000;
				className = (className === "dark" ? "":"dark");
				showLog("[ "+getTime()+" ]&nbsp;&nbsp;treeNode:" + treeNode.name );
				showLog("加载完毕，共进行 "+ (treeNode.times-1) +" 次异步加载, 耗时："+ usedTime + " 秒");
			}
		}
		function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			alert("异步获取数据出现异常。");
			treeNode.icon = "";
			zTree.updateNode(treeNode);
		}
		function ajaxGetNodes(treeNode, reloadType) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			if (reloadType == "refresh") {
				treeNode.icon = "${pageContext.request.contextPath }/css/zTreeStyle/img/loading.gif";
				zTree.updateNode(treeNode);
			}
			zTree.reAsyncChildNodes(treeNode, reloadType, true);
		}
		function showLog(str) {
			if (!log) log = $("#log");
			log.append("<li class='"+className+"'>"+str+"</li>");
			if(log.children("li").length > 4) {
				log.get(0).removeChild(log.children("li")[0]);
			}
		}
		function getTime() {
			var now= new Date(),
			h=now.getHours(),
			m=now.getMinutes(),
			s=now.getSeconds(),
			ms=now.getMilliseconds();
			return (h+":"+m+":"+s+ " " +ms);
		}
		 */

		//初始化zTree树
		$(document).ready(function() {
			$.fn.zTree.init($("#treeDemo"), setting);
		});
	</script>
	<div hidden id="hiddenZtree" class="zTreeDemoBackground"
		style="margin-left: 40px; margin-top: 20px;">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</body>
</html>