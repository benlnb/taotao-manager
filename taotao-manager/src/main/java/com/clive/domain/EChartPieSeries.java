package com.clive.domain;

import java.util.List;

public class EChartPieSeries {
	private List<EChartsResultPie> series;

	public List<EChartsResultPie> getSeries() {
		return series;
	}

	public void setSeries(List<EChartsResultPie> series) {
		this.series = series;
	}

	@Override
	public String toString() {
		return "Series [series=" + series + "]";
	}
	
}
