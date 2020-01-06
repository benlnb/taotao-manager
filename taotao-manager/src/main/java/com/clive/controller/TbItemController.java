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
import org.springframework.web.bind.annotation.ResponseBody;

import com.clive.bean.TbItem;
import com.clive.bean.TbItemCat;
import com.clive.bean.TbItemJson;
import com.clive.service.TbItemService;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
@RequestMapping("/item")
public class TbItemController {
	@Autowired
	private TbItemService tbItemService;
	
	/*
	 * 根据id找商品
	 */
	@RequestMapping("/itemId")
	@ResponseBody
	public TbItemJson findTbItemById(Long itemId){
		System.out.println(itemId);
		TbItem tbItem = tbItemService.findTbItemById(itemId);
		if(tbItem==null){
			System.out.println("oooooooooooooooooooooooooo");
			System.out.println("oooooooooooooooooooooooooo");
			System.out.println("oooooooooooooooooooooooooo");
		}else{
			List<TbItem> itemAll = new ArrayList<TbItem>();
			itemAll.add(tbItem);
			TbItemJson json = new TbItemJson();
			json.setItemAll(itemAll);
			json.setCount(1);
			return json;
		}
		return null;
	}
	
	/*
	 * 查询所有商品
	 */
	@RequestMapping("/itemJson")
	@ResponseBody
	public TbItemJson findTbItemAll(int page,int limit){
		page = (page-1)*limit;
		List<TbItem> itemAll = tbItemService.findTbItemAll(page,limit);
		int count = tbItemService.findTbitemCount();
		TbItemJson json = new TbItemJson();
		json.setItemAll(itemAll);
		json.setCount(count);
		return json;
	}
	
	/*
	 * 删除商品
	 */
	@RequestMapping("/itemDel")
	@ResponseBody
	public int delete(String[] ids,String op){
		List<Long> resultList = new ArrayList<>(ids.length);
		for(String str : ids) {
			if(str.equals("")){
				break;
			}
			Long i = Long.parseLong(str);
			System.out.println(i);
			resultList.add(i);
		}
		if(op.equals("del")){
			int code = tbItemService.delete(resultList);
			return code;
		}else if(op.equals("putOn")){
			int code = tbItemService.putOn(resultList);
			return code;
		}else if(op.equals("putOff")){
			int code = tbItemService.putOff(resultList);
			return code;
		}
		return 0;
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
	 * 分类信息zTree
	 */
	@RequestMapping("/addItem")
	@ResponseBody
	public int findCatZtree1(Long cid,String title,String sellPoint,Long price,Integer num,String barcode,String image){
		Date created = new Date();
		Date updated = created;
		Byte status = 1;
		TbItem tbitem = new TbItem();
		tbitem.setCid(cid);
		tbitem.setBarcode(barcode);
		tbitem.setCreated(created);
		tbitem.setImage(image);
		tbitem.setNum(num);
		tbitem.setPrice(price);
		tbitem.setSellPoint(sellPoint);
		tbitem.setStatus(status);
		tbitem.setTitle(title);
		tbitem.setUpdated(updated);
		System.out.println(tbitem);
		int i = tbItemService.addItem(tbitem);
		return i;
	}
}
