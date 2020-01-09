package com.clive.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.clive.bean.TbItem;
import com.clive.bean.TbItemCat;
import com.clive.bean.TbItemJson;
import com.clive.domain.EChartPieSeries;
import com.clive.domain.EChartLineResult;
import com.clive.domain.EChartsResultPie;
import com.clive.service.TbItemService;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
@RequestMapping("/item")
public class TbItemController {
	@Autowired
	private TbItemService tbItemService;

	/*
	 * 根据/名称/分类/描述 找商品
	 */
	@RequestMapping("/search")
	@ResponseBody
	public TbItemJson findTbItemBy(String select_title, String select_cat,String select_des,int page,int limit){
		System.out.println("————————————————————————————————");
		System.out.println("select_title: "+select_title);
		System.out.println("————————————————————————————————");
		System.out.println("select_cat: "+select_cat);
		System.out.println("————————————————————————————————");
		System.out.println("select_des: "+select_des);
		System.out.println("————————————————————————————————");
		TbItemJson tbItemJson = tbItemService.findTbItemBy(select_title,select_cat,select_des,page,limit);
		return tbItemJson;
	}

	/*
	 * 查询所有商品
	 */
	@RequestMapping("/itemJson")
	@ResponseBody
	public TbItemJson findTbItemAll(int page,int limit){
		TbItemJson json = tbItemService.findTbItemAll(page,limit);
		return json;
	}

	/*
	 * 删除商品/上架/下架
	 */
	@RequestMapping("/itemDel")
	@ResponseBody
	public int delete(String[] ids,String op){
		int code = tbItemService.delete(ids,op);
		return code;
	}

	/*
	 * 分类信息zTree
	 */
	@RequestMapping("/catZtree")
	@ResponseBody
	public List<TbItemCat> findCatZtree(){
		List<TbItemCat> tbItemCats = tbItemService.findCatZtree();
		return tbItemCats;
	}

	/*
	 * 添加商品
	 */
	@RequestMapping("/addItem")
	@ResponseBody
	public int addItem(Long cid,String title,String sellPoint,Long price,Integer num,String barcode,Byte status,String image){
		int i = tbItemService.addItem(cid,title,sellPoint,price,num,barcode,status,image);
		return i;
	}
	
	/*
	 * echart1
	 */
	@RequestMapping("/echart1")
	@ResponseBody
	public EChartPieSeries echart1(){
		EChartPieSeries series = tbItemService.categoryStatistics();
		return series;
	}
	
	/*
	 * echart2
	 */
	@RequestMapping("/echart2")
	@ResponseBody
	public EChartLineResult echart2(){
		EChartLineResult eChartResultBar = tbItemService.categoryStatistics2();
		return eChartResultBar;
	}
	
	
	

	/*
	 * 多图上传
	 */
//	@RequestMapping("/picsUpload")
//	//requestParam要写才知道是前台的那个数组
//	public String filesUpload(@RequestParam("myfiles") MultipartFile[] files,
//			HttpServletRequest request) {
//		List<String> list = new ArrayList<String>();
//		if (files != null && files.length > 0) {
//			for (int i = 0; i < files.length; i++) {
//				MultipartFile file = files[i];
//				// 保存文件
//				list = saveFile(request, file, list);
//			}
//		}
//		//写着测试，删了就可以
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println("集合里面的数据" + list.get(i));
//		}
//		return "index";//跳转的页面
//	}

}
