package com.clive.bean;

import java.io.Serializable;
import java.util.Date;

public class TbItemCat implements Serializable{
	private int id;
	private int parentId;
	private String name;
	private Byte status;
	private int sortOrder;
	private Byte isParent;
	private Date created;
	private Date updated;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Byte getStatus() {
		return status;
	}
	public void setStatus(Byte status) {
		this.status = status;
	}
	public int getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}
	public Byte getIsParent() {
		return isParent;
	}
	public void setIsParent(Byte isParent) {
		this.isParent = isParent;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getUpdated() {
		return updated;
	}
	public void setUpdated(Date updated) {
		this.updated = updated;
	}
	@Override
	public String toString() {
		return "TbItemCat [id=" + id + ", parentId=" + parentId + ", name=" + name + ", status=" + status
				+ ", sortOrder=" + sortOrder + ", isParent=" + isParent + ", created=" + created + ", updated="
				+ updated + "]";
	}
	
	
}
