package cn.itheima.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.itheima.pojo.Items;

@Controller
public class ItemsController {
	
	@RequestMapping("/list")
	public ModelAndView itemsList() throws Exception{
		List<Items> itemList = new ArrayList<>();
		
		Items items_1 = new Items();
		items_1.setName("����ʼǱ�_3");
		items_1.setPrice(6000f);
		items_1.setDetail("ThinkPad T430 ����ʼǱ����ԣ�");
		
		Items items_2 = new Items();
		items_2.setName("ƻ���ֻ�");
		items_2.setPrice(5000f);
		items_2.setDetail("iphone6ƻ���ֻ���");
		
		itemList.add(items_1);
		itemList.add(items_2);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("itemList", itemList);
		
		modelAndView.setViewName("/WEB-INF/jsp/itemList.jsp");
		return modelAndView;
	}
}