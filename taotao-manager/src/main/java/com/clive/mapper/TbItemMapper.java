package com.clive.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.clive.bean.TbItem;
import com.clive.bean.TbItemCat;

public interface TbItemMapper {
	/**
	 * 查询数据库中tbitem表，根据商品id查询商品信息
	 * @param tbItemId
	 * @return
	 */
	TbItem findTbItemById(Long tbItemId);

	List<TbItem> findTbItemAll(@Param("page") int page,@Param("limit") int limit);

	int findTbitemCount();

	int delete(List<Long> ids);

	int putOn(List<Long> ids);

	int putOff(List<Long> ids);

	List<TbItemCat> findCatZtree();

	int addItem(TbItem tbItem);

}
