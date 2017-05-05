package cn.itheima.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.itheima.pojo.Items;
import cn.itheima.service.ItemsService;
import cn.itheima.vo.QueryVo;

@Controller
public class ItemsController {
	
	@Autowired
	private ItemsService itemsService;

	@RequestMapping("/list")
	public ModelAndView itemsList() throws Exception{
		List<Items> list = itemsService.list();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("itemList", list);
		modelAndView.setViewName("itemList");
		return modelAndView;
	}
	
	@RequestMapping("/itemEdit")
	public String itemEdit(HttpServletRequest request, 
			Model model) throws Exception{
		
		String idStr = request.getParameter("id");
		Items items = itemsService.findItemsById(Integer.parseInt(idStr));
		
		model.addAttribute("item", items);
		return "editItem";
	}
	
	@RequestMapping("/updateitem")
	//public String update(Integer id, String name, Float price, String detail) throws Exception{
	public String update(Items items) throws Exception{

		items.setCreatetime(new Date());
		
		itemsService.updateItems(items);
		
		return "success";
	}
	
	
	@RequestMapping("/search")
	public String search(QueryVo vo) throws Exception{
		System.out.println(vo);
		return "";
	}
}
