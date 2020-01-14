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
<style type="text/css">
	body {
		background-color: #FFFFFF;
	}
</style>
</head>
<body>

	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend class="">商品添加</legend>
	</fieldset>

	<form class="layui-form" action="" lay-filter="example">
	<!-- <form class="layui-form" action="" lay-filter="example" enctype="multipart/form-data">  -->

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
			<label class="layui-form-label">状态</label>
			<div class="layui-input-block">
				<input type="radio" name="status" value="1" title="上架" checked>
				<input type="radio" name="status" value="0" title="下架">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">图片</label> <input type="hidden"
				name="image" class="multiple_show_img" value="">
			<div class="layui-upload">
				<button type="button" class="layui-btn" id="multiple_img_upload">选择图片</button>
				<button type="button" class="layui-btn" id="startUpload">开始上传</button>
				<blockquote class="layui-elem-quote layui-quote-nm"
					style="margin-top: 10px;margin-left: 110px;">
					预览：
					<div class="layui-upload-list" id="div-slide_show"></div>
				</blockquote>
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
				<button type="submit" class="layui-btn" id="example1" lay-submit=""
					lay-filter="example1">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>



	<script>
	
	
	
		/*
			表单提交
		*/
		layui.use([ 'form' ], function() {
			var form = layui.form;
			form.render('radio');
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
					}
				});
			return false;
			});
		});

		
		
		/*
			弹出层
		*/
		layui.use('layer', function() { 
			var $ = layui.jquery, layer = layui.layer;

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
			//按钮点击
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
		//初始化zTree树
		$(document).ready(function() {
			$.fn.zTree.init($("#treeDemo"), setting);
		});
		
		
		
		
		
		/*
			图片上传
		*/
		var multiple_images = [];//图片容器
		layui.use('upload', function () {
		        var upload = layui.upload;
				//多图片上传
		        upload.render({
		            elem: '#multiple_img_upload'
		            ,url: '/item/picsUpload'
		            ,auto: false
		            ,multiple: true
		            ,drag: true
		            ,bindAction: '#startUpload'
		            ,choose:function(obj){
		            	var files = this.files = obj.pushFile();
		            	
		            	//预读本地文件示例，不支持ie8
		                obj.preview(function(index, file, result){
		                    $('#div-slide_show').append('<img style="margin-right:10px" height="120" width="120" src="'+ result +'" alt="'+ file.name
		                        +'" title="点击删除" class="layui-upload-img" id="delMultipleImgs" value="this" οnclick="delMultipleImgs(this)">')
		                });
		                multiple_images.push(obj.data.url);
	                    $('.multiple_show_img').val(multiple_images);
	                    alert(obj.data.url);
		            }
		            ,before: function(obj){
		                
		            }
		            ,done: function(res){
		            	
		                //如果上传成功
		                if (res.status == 1) {
		                    //追加图片成功追加文件名至图片容器
		                    multiple_images.push(res.data.url);
		                    $('.multiple_show_img').val(multiple_images);
		                }else {
		                	alert("aaa");
		                	//提示信息
		                    dialog.tip(res.message);
		                }
		            }
		        });

		    });
		
		
		//单击图片删除图片 【注册全局函数】
		$(document).on('click','#delMultipleImgs',function(){
			var subscript=$("#div-slide_show.img").index(this);
			var i = $("#div-slide_show.img");
			alert("subscript:"+subscript+"-----#div-slide_show.img:"+i);
			alert("图片容器："+multiple_images);
			//alert(this.src);
	        //删除图片
	        this.remove();
	        //删除数组
	        multiple_images.splice(subscript, 1);
	        //重新排序
	        multiple_images.sort();
	        $('.multiple_show_img').val(multiple_images);
	        //console.log("multiple_images",multiple_images);
	        //返回
	        return ;
		});
		
		
		
	      
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
	<div hidden id="hiddenZtree" class="zTreeDemoBackground"
		style="margin-left: 40px; margin-top: 20px;">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</body>
</html>