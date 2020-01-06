package com.clive.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clive.bean.TbItem;
import com.clive.bean.TbItemCat;
import com.clive.mapper.TbItemMapper;
import com.clive.service.TbItemService;
@Service
public class TbItemServiceImpl implements TbItemService {
	@Autowired
	private TbItemMapper tbItemMapper;

	@Override
	public TbItem findTbItemById(Long tbItemId) {
		TbItem tbItem = tbItemMapper.findTbItemById(tbItemId);
		return tbItem;
	}

	@Override
	public List<TbItem> findTbItemAll(int page,int limit) {
		List<TbItem> tbItems = tbItemMapper.findTbItemAll(page,limit);
		return tbItems;
	}

	@Override
	public int findTbitemCount() {
		int count = tbItemMapper.findTbitemCount();
		return count;
	}

	@Override
	public int delete(List<Long> ids) {
		int i = tbItemMapper.delete(ids);
		return i;
	}

	@Override
	public int putOn(List<Long> ids) {
		int i = tbItemMapper.putOn(ids);
		return i;
	}

	@Override
	public int putOff(List<Long> ids) {
		int i = tbItemMapper.putOff(ids);
		return i;
	}

	@Override
	public List<TbItemCat> findCatZtree() {
		List<TbItemCat> catZtrees= tbItemMapper.findCatZtree();
		return catZtrees;
	}

	@Override
	public int addItem(TbItem tbitem) {
		int i = tbItemMapper.addItem(tbitem);
		return i;
	}

}
