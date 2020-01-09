package com.clive.service;

import java.util.Date;
import java.util.List;

import com.clive.bean.TbItem;
import com.clive.bean.TbItemCat;
import com.clive.bean.TbItemJson;
import com.clive.domain.EChartLineResult;
import com.clive.domain.EChartPieSeries;

public interface TbItemService {
	/**
	 * 查询商品指定信息
	 * @param 
	 * @return 指定的商品信息
	 */
	TbItemJson findTbItemBy(String select_title, String select_cat,String select_des,int page,int limit);
	
	TbItemJson findTbItemAll(int page,int limit);

	int findTbitemCount();

	int delete(String[] ids,String op);

	List<TbItemCat> findCatZtree();

	int addItem(Long cid,String title,String sellPoint,Long price,Integer num,String barcode,Byte status,String image);

	EChartPieSeries categoryStatistics();

	EChartLineResult categoryStatistics2();



}
