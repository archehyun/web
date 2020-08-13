package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WellcomeController {

	public WellcomeController() {
		System.out.println("inint");

	}

	@RequestMapping("/hello")
	public ModelAndView hello() {
		System.out.println("st");

		new APIController();
		String msg = "Hello, World!";
		return new ModelAndView("hello", "msg", msg);
	}

}
