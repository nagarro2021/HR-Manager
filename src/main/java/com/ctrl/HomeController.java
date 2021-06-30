package com.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Model.LoginInfo;
import com.dao.LoginDao;

@Controller
public class HomeController {

	@Autowired
	LoginDao loginDao;

	@RequestMapping(value = "/home")
	public ModelAndView login() {
		String str = "New User? -> First Register...Then Login!";
		System.out.println("Hello login.jsp controller");
		ModelAndView model = new ModelAndView("Login");
		model.addObject("heading", str);
		return model;
	}
	
	
	@RequestMapping(value = "/SignOut", method = RequestMethod.POST)
	public ModelAndView signout() {
		String str = "New User? -> First Register...Then Login!";
		ModelAndView model = new ModelAndView();
		model.addObject("username", null);
		model.addObject("heading", str);
		model.setViewName("Login");
		return model;

	}


	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView searchEmployees(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Hello SearchResult.jsp");
		String username=request.getParameter("username");
		System.out.println("username"+":"+username);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("username", username);
		
		mv.setViewName("SearchResult");
		return mv;
	}
	
	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public ModelAndView addEmployee(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Hello Input.jsp");
		
		String code= request.getParameter("employeeCode");
		System.out.println(code);
		String username=request.getParameter("username");
		System.out.println("username2"+":"+username);
		ModelAndView mv = new ModelAndView();
		mv.addObject("username", username);
		mv.setViewName("Input");
		return mv;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateEmployee(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Hello update.jsp");

		ModelAndView mv = new ModelAndView();
		mv.setViewName("Input2");
		return mv;
	}
	
	@RequestMapping(value = "/saveLogin", method = RequestMethod.POST)
	public ModelAndView savelogin(@ModelAttribute("todo") LoginInfo todo) {
//		String str = "You are inside savelogin controller";
//		m.addAttribute("savelogin", str);
//		m.addAttribute("page", "InsideSaveLoginController");
		System.out.println("Hello savelogin controller");
		System.out.println(todo);
		this.loginDao.saveUser(todo);
		ModelAndView model = new ModelAndView("Login");
		
		model.addObject("msg", "successfully added.....");
		return model;
	}
	
}