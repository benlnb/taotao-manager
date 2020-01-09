package com.clive.domain;

import java.util.Arrays;

public class EChartLineResult {
	private EChartXAxis xAxis;
	private EChartYAxis yAxis;
	//private EChartPieAndLineSeries series;
	private EChartLineSeries series;
	public EChartXAxis getxAxis() {
		return xAxis;
	}
	public void setxAxis(EChartXAxis xAxis) {
		this.xAxis = xAxis;
	}
	public EChartYAxis getyAxis() {
		return yAxis;
	}
	public void setyAxis(EChartYAxis yAxis) {
		this.yAxis = yAxis;
	}
	public EChartLineSeries getSeries() {
		return series;
	}
	public void setSeries(EChartLineSeries series) {
		this.series = series;
	}
	@Override
	public String toString() {
		return "EChartLineResult [xAxis=" + xAxis + ", yAxis=" + yAxis + ", series=" + series + "]";
	}

	
	
}
