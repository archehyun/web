package com.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

public class APIController {

	Thread thread;

	public APIController() {
	}

	@RequestMapping(value = "/api", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(HttpServletRequest request, @RequestParam("name") String name, @RequestParam("age") String age) throws Exception {
		JSONObject json = new JSONObject();

		json.put("success", true);
		json.put("data", name);
		json.put(null, age);

		return json.toJSONString();
	}

	class APITimer implements Runnable {

		@Override
		public void run() {
			while (true) {
				System.out.println("TEst");
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}
