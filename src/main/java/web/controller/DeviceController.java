package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import web.account.service.AccountService;
import web.category.service.BaseService;

@Controller
@RequestMapping("/device/*")
public class DeviceController {

	@Resource(name = "accountService")
	private AccountService accountService;

	@Resource(name = "baseService")
	private BaseService baseService;

	@RequestMapping("/home.do")
	public ModelAndView home(Map<String, Object> commandMap) {

		String msg = "Hello, World! account1";

		ModelAndView mv = new ModelAndView("device", "msg", msg);

		commandMap.put("gubun_type", "out");

		List<Map<String, Object>> gubun = baseService.selectGubun(commandMap);

		mv.addObject("gubun", gubun);

		return mv;
	}

	@RequestMapping(value = "/device.do")
	public ModelAndView account(HttpServletRequest rs) {

		String msg = "Hello, World! account1";

		ModelAndView mv = new ModelAndView("device", "msg", msg);
		Map<String, Object> commandMap = new HashMap<String, Object>();

		commandMap.put("gubun_type", "out");
		commandMap.put("type", rs.getParameter("type"));

		List<Map<String, Object>> list = accountService.selectAccountList(commandMap);

		List<Map<String, Object>> gubun = baseService.selectGubun(commandMap);

		mv.addObject("list", list);
		mv.addObject("gubun", gubun);
		mv.addObject("msg", msg);

		return mv;
	}

}
