package com.clive.mapper;

import java.util.List;

import com.clive.bean.TbItem;

public interface TbItemMapper {
	/**
	 * 查询数据库中tbitem表，根据商品id查询商品信息
	 * @param tbItemId
	 * @return
	 */
	TbItem findTbItemById(Long tbItemId);

	List<TbItem> findTbItemAll();

}
