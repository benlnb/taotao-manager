package com.clive.domain;

public class EChartPieAndLineSeries {
	private EChartLineSeries eChartLineSeries;
	private EChartPieSeries eChartPieSeries;
	public EChartLineSeries geteChartLineSeries() {
		return eChartLineSeries;
	}
	public void seteChartLineSeries(EChartLineSeries eChartLineSeries) {
		this.eChartLineSeries = eChartLineSeries;
	}
	public EChartPieSeries geteChartPieSeries() {
		return eChartPieSeries;
	}
	public void seteChartPieSeries(EChartPieSeries eChartPieSeries) {
		this.eChartPieSeries = eChartPieSeries;
	}
	@Override
	public String toString() {
		return "EChartPieAndLineSeries [eChartLineSeries=" + eChartLineSeries + ", eChartPieSeries=" + eChartPieSeries
				+ "]";
	}
	
}
