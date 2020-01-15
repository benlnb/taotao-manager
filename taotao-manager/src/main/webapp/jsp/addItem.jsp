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
<link href="${pageContext.request.contextPath }/kindeditor/themes/simple/simple.css" rel="stylesheet"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/kindeditor/kindeditor-all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/kindeditor/lang/zh-CN.js"></script>
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
			<!--************这里添加的隐藏的输入框，用来传递images的参数***************-->
   			<input type="hidden" name="images" class="image">
			
			<label class="layui-form-label">图片</label> <input type="hidden"
				name="image" class="multiple_show_img" value="">
			<div class="layui-upload">
				<button type="button" style="float:left;" class="layui-btn layui-btn-radius layui-btn-primary" id="multiple_img_upload">选择图片</button>
				&nbsp;&nbsp;
				<button type="button" style="" class="layui-btn layui-btn-radius layui-btn-primary" id="startUpload">开始上传</button>
				<blockquote class="layui-elem-quote layui-quote-nm"
					style="margin-top: 10px;margin-left: 110px;float:left;width:88.6%">
					预览：
					<div class="layui-upload-list" id="div-slide_show"></div>
					<input style="" type="text" id="multiple_show_img" name="multiple_show_img"
						
						class="layui-input">
				</blockquote>
			</div>
		</div>



		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">商品详情</label>
			<div class="layui-input-block">
				<!-- 隐藏的输入框 -->
				<input style="display: none;" type="text" id="des" name="des" lay-verify="required"
						autocomplete="off" placeholder="商品详情" class="layui-input">
			    <textarea name="content1" style="width:660px;height:340px;visibility:hidden;">
			   		<span style="color:#9B9B9B;">添加商品描述</span>
			    </textarea>

			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn" id="example1" lay-submit=""
					lay-filter="example1">立即提交</button>
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
		        var $ = layui.jquery,
		        	upload = layui.upload;
				//多图片上传
		        upload.render({
		            elem: '#multiple_img_upload'
		            ,size: 10240
		            ,url: '/item/picsUpload'
		            ,auto: false
		            ,bindAction: '#startUpload'
		            ,multiple: true
		            ,drag: true
		            ,choose:function(obj){
		            	var files = this.files = obj.pushFile();
		            	
		            	//预读本地文件示例，不支持ie8
		                obj.preview(function(index, file, result){
		                    $('#div-slide_show').append('<div style="float:left;" class="image-container" id="container'+index+'"><div class="delete-css"></div>' +
                        	'<img title="点击删除" id="showImg'+index+'" style="width: 140px;height: 140px; margin:10px;cursor:pointer;" src="'+ result +'" alt="'+ file.name +'" ></div>')
                        	$("#showImg" + index).bind('click', function () {
                                delete files[index];
                                $("#container"+index).remove();
                            });
		                });
		            }
		            ,before: function(obj){
		            	
		            }
		            ,done: function(res){
		                var demoText = $('#startUpload');
		            	 //如果上传失败
		                if(res.code > 0){
		                	demoText.html('<span style="color: red;">点击重试</span>');
		                    return layer.msg('上传失败');
		                }
		                //上传成功
		                layer.msg("成功");
		                demoText.html('<span style="color: #4cae4c;">上传成功✔</span>');

		                var urlurl = res.data.src;
		                multiple_images.push(urlurl);
		                $("#multiple_show_img").attr("value", multiple_images);
		                //var fileupload = $(".image");
		                //fileupload.attr("value",res.data.src);
		                //console.log(fileupload.attr("value"));
	                    //$('.multiple_show_img').val(multiple_images);
		                
	                    
		            }
		            ,error: function(){
		                //演示失败状态，并实现重传
		                layer.msg('error');
		                var demoText = $('#startUpload');
		                demoText.html('<span style="color: red;"> <a class="layui-btn layui-btn-xs demo-reload">上传失败，点击重试</a></span>');
		                demoText.find('.demo-reload').on('click', function(){
		                    uploadInst.upload();
		                });
		            }
		        });

		    });
		
		
		
		
	      
		
		
		
		
		
		
		//富文本编辑器初始化
		initKindEditor();
		function initKindEditor(){ 
			var keditor =  KindEditor.create('textarea[name="content1"]', {
				themeType: "simple",
				uploadJson: '/item/picsUpload',
	            resizeType: 2,
	            pasteType: 2,
	            afterCreate: function () {
	                this.sync();
	            },
	            afterFocus : function(){//获得焦点 删除默认文字信息
			         if(keditor.html() == '<span style="color:#9B9B9B;">添加商品描述</span>'){
			       	  keditor.html('');
			         }
			     },
	            afterBlur: function () {
	           	// console.log(editor.html());
			        if(keditor.html() == '<br/>' || keditor.html() == ''){
			       	 keditor.html('<span style="color:#9B9B9B;">添加商品描述</span>');
			        }
	             	var valuee = keditor.html();
	            	$("#des").attr("value", valuee);
	                this.sync();
	            },
	            afterChange: function () {
	                //富文本输入区域的改变事件，一般用来编写统计字数等判断
	            },
	            afterUpload:function(url){
	               //上传图片后的代码
	               alert("afterUpload:function");
	            },
				//否允许浏览服务器已上传文件,默认是false
	            allowFileManager: true
	        });
		};
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
	<div hidden id="hiddenZtree" class="zTreeDemoBackground"
		style="margin-left: 40px; margin-top: 20px;">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</body>
</html>