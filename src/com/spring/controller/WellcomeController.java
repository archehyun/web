package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/api")
public class WellcomeController {

	public WellcomeController() {
		System.out.println("inint");

	}

	@RequestMapping("/monitor.do")
	public ModelAndView hello() {

		new APIController();
		String host2 = "localhost";
		String serverStr = "ws://" + host2 + ":8080/air/websocket";

		ModelAndView mv = new ModelAndView("monitor", "serverStr", serverStr);

		return mv;
	}

}
