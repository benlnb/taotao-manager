package com.clive.service;

import java.util.Date;
import java.util.List;

import com.clive.bean.TbItem;
import com.clive.bean.TbItemCat;

public interface TbItemService {
	/**
	 * 根据商品id查询商品指定信息
	 * @param tbItemId 商品id
	 * @return 指定商品id的商品信息
	 */
	TbItem findTbItemById(Long tbItemId);
	
	List<TbItem> findTbItemAll(int page,int limit);

	int findTbitemCount();

	int delete(List<Long> ids);

	int putOn(List<Long> ids);

	int putOff(List<Long> ids);

	List<TbItemCat> findCatZtree();

	int addItem(TbItem tbitem);
}
