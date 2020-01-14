package com.clive.mapper;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.clive.bean.TbItem;
import com.clive.bean.TbItemCat;

public interface TbItemMapper {
	/**
	 * 
	 * @param 
	 * @return
	 */
	HashSet<Integer> findCid1ByCat(@Param("searchContent") String searchContent);
	
	HashSet<Integer> findCid23ByCat(@Param("cIds") HashSet<Integer> cIds);
	
	HashSet<Integer> findCid4ByCat(@Param("cIds") HashSet<Integer> cIds);
	
	int findTbItemSize(@Param("select_title") String select_title,@Param("cIds") HashSet<Integer> cIds,@Param("select_des") String select_des);
	List<TbItem> findTbItemBy(@Param("select_title") String select_title,@Param("cIds") HashSet<Integer> cIds,@Param("select_des") String select_des,@Param("page") int page,
			@Param("limit") int limit);
	
	int findTbItemSizeWithCids(@Param("select_title") String select_title,@Param("cIds") HashSet<Integer> cIds,@Param("select_des") String select_des);
	List<TbItem> findTbItemByWithCids(@Param("select_title") String select_title,@Param("cIds") HashSet<Integer> cIds,@Param("select_des") String select_des,@Param("page") int page,
			@Param("limit") int limit);
	
	
	
	
	List<TbItem> findTbItemAll(@Param("page") int page,@Param("limit") int limit);

	int findTbitemCount();

	int delete(@Param("ids") List<Long> ids,@Param("updated") Date updated);

	int putOn(@Param("ids") List<Long> ids,@Param("updated") Date updated);

	int putOff(@Param("ids") List<Long> ids,@Param("updated") Date updated);

	List<TbItemCat> findCatZtree();

	int addItem(TbItem tbItem);
	
	List<String> findCategoryNameParentId0();
	
	int findCategoryIdName(@Param("cName") String cName);
	
	List<Integer> findCid3ByCid2(@Param("cIds2") List<Integer> cIds2);
	
	Integer findCountByCid3(@Param("cIds3") List<Integer> cIds3);

	int findCustumerCountByDate(@Param("date1") String date1,@Param("date2") String date2);

	


}
