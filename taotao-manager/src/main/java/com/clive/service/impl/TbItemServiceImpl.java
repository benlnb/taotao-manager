package com.clive.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clive.bean.TbItem;
import com.clive.bean.TbItemCat;
import com.clive.bean.TbItemJson;
import com.clive.domain.CategoryStatistics;
import com.clive.domain.EChartLineSeries;
import com.clive.domain.EChartPieAndLineSeries;
import com.clive.domain.EChartLineResult;
import com.clive.domain.EChartXAxis;
import com.clive.domain.EChartYAxis;
import com.clive.domain.EChartsResultPie;
import com.clive.domain.EChartPieSeries;
import com.clive.mapper.TbItemMapper;
import com.clive.service.TbItemService;
@Service
public class TbItemServiceImpl implements TbItemService {
	private static final List<Integer> Integer = null;
	@Autowired
	private TbItemMapper tbItemMapper;

	/*
	 * 搜索
	 */
	@Override
	public TbItemJson findTbItemBy(String select_title, String select_cat,String select_des,int page,int limit) {
		select_title = "%"+select_title+"%";
		select_des = "%"+select_des+"%";
		List<TbItem> itemSearch = null;
		int itemSearchSize = 0;
		HashSet<Integer> ids1 = null;
		HashSet<Integer> ids2 = null;
		HashSet<Integer> ids3 = null;
		HashSet<Integer> ids4 = null;
		if(select_cat!=""){
			//根据搜索信息查询分类
			ids1 = tbItemMapper.findCid1ByCat(select_cat);
			System.out.println("_______________第1次搜索__________________");
			for (Integer integer : ids1) {
				System.out.println(integer);
			}
			//根据第一次查询得到的id查二级分类
			ids2 = tbItemMapper.findCid23ByCat(ids1);
			System.out.println("_______________第2次搜索__________________");
			if(ids2.size()==0){
				//不if判断会报错
				System.out.println("ids2为空空空空空空空空空空空空空空空");
				ids4 = ids1;
			}else{
				//根据第二次查询得到的id查三级分类
				ids3 = tbItemMapper.findCid23ByCat(ids2);
				System.out.println("_______________第3次搜索__________________");
				for (Integer integer : ids3) {
					System.out.println(integer);
				}
				//剔除重复id并得到所有id
				for (Integer integer : ids3) {
					ids1.add(integer);
				}
				for (Integer integer : ids2) {
					ids1.add(integer);
				}
				//剔除1，2级id，只留下3级id
				ids4 = tbItemMapper.findCid4ByCat(ids1);
			}

			itemSearchSize = tbItemMapper.findTbItemSizeWithCids(select_title,ids4,select_des);
			page = (page-1)*limit;
			itemSearch = tbItemMapper.findTbItemByWithCids(select_title,ids4,select_des,page,limit);

		}else{
			itemSearchSize = tbItemMapper.findTbItemSize(select_title,ids4,select_des);
			//判断页面传来的当前页是否大于搜索得到的页数总和
			//总页数
			int totalPage = ((itemSearchSize-1)/limit+1);
			if(page>totalPage){
				page = totalPage;
			}
			page = (page-1)*limit;

			System.out.println("itemSearchSize:::::"+itemSearchSize);

			itemSearch = tbItemMapper.findTbItemBy(select_title,ids4,select_des,page,limit);

			for (TbItem tbItem : itemSearch) {
				System.out.println(tbItem);
			}
		}

		TbItemJson json = new TbItemJson();
		json.setItemAll(itemSearch);
		json.setCount(itemSearchSize);

		return json;
	}

	/*
	 * 查询所有商品
	 */
	@Override
	public TbItemJson findTbItemAll(int page,int limit) {
		page = (page-1)*limit;
		List<TbItem> tbItems = tbItemMapper.findTbItemAll(page,limit);
		int count = tbItemMapper.findTbitemCount();
		TbItemJson json = new TbItemJson();
		json.setItemAll(tbItems);
		json.setCount(count);
		return json;
	}

	/*
	 * 查询商品数量
	 */
	@Override
	public int findTbitemCount() {
		int count = tbItemMapper.findTbitemCount();
		return count;
	}

	/*
	 * 删除/上架/下架商品
	 */
	@Override
	public int delete(String[] ids,String op) {
		Date updated = new Date();
		List<Long> resultList = new ArrayList<>(ids.length);
		for(String str : ids) {
			if(str.equals("")){
				break;
			}
			Long i = Long.parseLong(str);
			System.out.println(i);
			resultList.add(i);
		}
		if(op.equals("del")){
			int code = tbItemMapper.delete(resultList,updated);
			return code;
		}else if(op.equals("putOn")){
			int code = tbItemMapper.putOn(resultList,updated);
			return code;
		}else if(op.equals("putOff")){
			int code = tbItemMapper.putOff(resultList,updated);
			return code;
		}
		return 0;
	}

	/*
	 * 商品分类zTree
	 */
	@Override
	public List<TbItemCat> findCatZtree() {
		List<TbItemCat> catZtrees= tbItemMapper.findCatZtree();
		return catZtrees;
	}

	/*
	 * 添加商品
	 */
	@Override
	public int addItem(Long cid,String title,String sellPoint,Long price,Integer num,String barcode,Byte status,String image) {
		Date created = new Date();
		Date updated = created;
		TbItem tbitem = new TbItem();
		tbitem.setCid(cid);
		tbitem.setBarcode(barcode);
		tbitem.setCreated(created);
		tbitem.setImage(image);
		tbitem.setNum(num);
		tbitem.setPrice(price);
		tbitem.setSellPoint(sellPoint);
		tbitem.setStatus(status);
		tbitem.setTitle(title);
		tbitem.setUpdated(updated);
		int i = tbItemMapper.addItem(tbitem);
		return i;
	}

	/*
	 * 分类统计echart
	 */
	@Override
	public EChartPieSeries categoryStatistics() {
		List<EChartsResultPie> results = new ArrayList<EChartsResultPie>();
		EChartsResultPie result = new EChartsResultPie();
		result.setName("分类");
		result.setType("pie");
		result.setRadius("75%");
		List<CategoryStatistics> data = new ArrayList<CategoryStatistics>();

		List<String> categoryNames = tbItemMapper.findCategoryNameParentId0();
		for (String cName : categoryNames) {
			CategoryStatistics categoryStatistics = new CategoryStatistics();
			int cId = tbItemMapper.findCategoryIdName(cName);
			List<Integer> cIds2 = tbItemMapper.findCid2ByCid(cId);
			List<Integer> cIds3 = tbItemMapper.findCid3ByCid2(cIds2);
			Integer count = tbItemMapper.findCountByCid3(cIds3);
			categoryStatistics.setName(cName+"("+count+")");
			categoryStatistics.setValue(count);
			data.add(categoryStatistics);
		}

		result.setData(data);
		results.add(result);
		EChartPieSeries series = new EChartPieSeries();
		series.setSeries(results);
		return series;
	}

	/*
	 * 分类统计/最近7天用户注册数量统计	echart
	 */
	@Override
	public EChartLineResult categoryStatistics2() {
		
		
		EChartLineResult eChartLineResult = new EChartLineResult();
		EChartXAxis xAxis = new EChartXAxis();
		EChartYAxis yAxis = new EChartYAxis();
		EChartLineSeries eChartLineSeries = new EChartLineSeries();
		xAxis.setType("category");
		yAxis.setType("value");
		eChartLineSeries.setType("line");
		//设置柱体名称
		String[] dd = new String[7];
		String[] ddd = new String[8];
		SimpleDateFormat format1 = new SimpleDateFormat("M/d");  
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");  
		for(int i =6;i>=0;i--){
			Calendar calendar = Calendar.getInstance();
			calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - i);  
			Date day = calendar.getTime();  
			String result = format1.format(day);
			dd[6-i] = result;
			String result2 = format2.format(day);
			ddd[6-i] = result2;
			if(i==0){
				calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + 1);
				day = calendar.getTime(); 
				result2 = format2.format(day);
				ddd[7] = result2;
			}
		}
		xAxis.setData(dd);
		//设置柱体的值
		int[] kk = new int[7];
		for(int i = 0;i<7;i++){
			kk[i] = tbItemMapper.findCustumerCountByDate(ddd[i],ddd[i+1]);
		}
		eChartLineSeries.setData(kk);
		eChartLineResult.setxAxis(xAxis);
		eChartLineResult.setyAxis(yAxis);
		
		
		eChartLineResult.setSeries(eChartLineSeries);
		return eChartLineResult;
		
		
		
	}

}
