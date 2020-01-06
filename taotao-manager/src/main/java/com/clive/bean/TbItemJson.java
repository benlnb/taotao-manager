package com.clive.bean;

import java.io.Serializable;
import java.util.List;

public class TbItemJson implements Serializable{
	private int count;
	private List<TbItem> itemAll;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List<TbItem> getItemAll() {
		return itemAll;
	}
	public void setItemAll(List<TbItem> itemAll) {
		this.itemAll = itemAll;
	}
	@Override
	public String toString() {
		return "TbItemJson [count=" + count + ", itemAll=" + itemAll + "]";
	}
	
}
