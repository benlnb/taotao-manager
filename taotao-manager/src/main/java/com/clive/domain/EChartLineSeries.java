package com.clive.domain;

import java.util.Arrays;

public class EChartLineSeries {
	private int[] data;
	private String type;
	public int[] getData() {
		return data;
	}
	public void setData(int[] data) {
		this.data = data;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "EChartBarSeries [data=" + Arrays.toString(data) + ", type=" + type + "]";
	}
	
}
