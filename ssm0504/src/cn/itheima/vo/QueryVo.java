package cn.itheima.vo;

import cn.itheima.pojo.Items;

public class QueryVo {

	private Items items;
	//可以再加订单对象，用户对象等。。。用于多条件查询。
	

	public Items getItems() {
		return items;
	}

	public void setItems(Items items) {
		this.items = items;
	}
	
}
