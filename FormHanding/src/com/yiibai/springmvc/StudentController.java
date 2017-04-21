package com.yiibai.springmvc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudentController {

	   @RequestMapping(value = "/student", method = RequestMethod.GET)
	   public ModelAndView student() {
	      return new ModelAndView("student", "command", new Student());
	   }

	   @RequestMapping(value = "/addStudent", method = RequestMethod.POST)
	   public String addStudent(@ModelAttribute("SpringWeb")Student student, 
	   ModelMap model) {
	      model.addAttribute("name", student.getName());
	      model.addAttribute("age", student.getAge());
	      model.addAttribute("id", student.getId());
	      model.addAttribute("sex", student.getSex());
	      model.addAttribute("password", student.getPassword());
	      model.addAttribute("address", student.getAddress());
	      model.addAttribute("receivePaper", student.isReceivePaper());
	      model.addAttribute("country", student.getCountry());
	      return "result";
	   }
	   
	   @ModelAttribute("countryList")
	   public Map<String, String> getCountryList()
	   {
		   Map<String, String> countryList = new HashMap<String, String>();		   
		   countryList.put("US", "United States");
		   countryList.put("CH", "China");
		   countryList.put("SG", "Singapore");
		   countryList.put("MY", "Malaysia");
		   return countryList;
	   }
	   
}
