package web.common.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import web.category.service.CommonService;

@Controller
@RequestMapping("/comm/*")
public class CommonController {

	@Resource(name = "commonService")
	CommonService commonService;

	@RequestMapping("/selectCode.do")
	public ModelAndView select(HttpServletRequest rs) {

		ModelAndView mv = new ModelAndView("code");

		//String main_cd = rs.getParameter("main_cd");
		//String cd_nm = rs.getParameter("cd_nm");

		HashMap<String, Object> commandMap = new HashMap<String, Object>();

		//commandMap.put("cd_nm", cd_nm);

		List list = commonService.selectCodeHList(commandMap);

		//commandMap.put("main_cd", main_cd);
		//System.out.println("main_cd:" + main_cd);

		//commonService.selectCodeDList(commandMap);

		mv.addObject("list", list);
		//mv.addObject("listd", listd);

		return mv;
	}

	@RequestMapping("/selectCodeDetail.do")
	public ModelAndView selectDetail(HttpServletRequest rs) {

		ModelAndView mv = new ModelAndView("code");

		String main_cd = rs.getParameter("main_cd");

		HashMap<String, Object> commandMap = new HashMap<String, Object>();

		//commandMap.put("cd_nm", cd_nm);

		List list = commonService.selectCodeHList(commandMap);

		commandMap.put("main_cd", main_cd);

		List listd = commonService.selectCodeDList(commandMap);

		mv.addObject("list", list);

		mv.addObject("listd", listd);

		return mv;
	}

	@RequestMapping("/code.do")
	public ModelAndView home(HttpServletRequest rs) {

		ModelAndView mv = new ModelAndView("code");

		String main_cd = rs.getParameter("main_cd");
		String cd_nm = rs.getParameter("cd_nm");

		HashMap<String, Object> commandMap = new HashMap<String, Object>();

		commandMap.put("cd_nm", cd_nm);

		List list = commonService.selectCodeHList(commandMap);

		commandMap.put("main_cd", main_cd);


		List listd = commonService.selectCodeDList(commandMap);

		mv.addObject("list", list);

		mv.addObject("listd", listd);

		return mv;
	}

	public Model test() {
		return null;
	}

	@RequestMapping("/coded.do")
	public ModelAndView detaile(HttpServletRequest rs) {

		ModelAndView mv = new ModelAndView("code");

		String main_cd = rs.getParameter("main_cd");
		String cd_nm = rs.getParameter("cd_nm");

		HashMap<String, Object> commandMap = new HashMap<String, Object>();

		commandMap.put("cd_nm", cd_nm);

		List list = commonService.selectCodeHList(commandMap);

		commandMap.put("main_cd", main_cd);

		List listd = commonService.selectCodeDList(commandMap);

		mv.addObject("list", list);

		mv.addObject("listd", listd);

		return mv;
	}

	@RequestMapping("/deleteCode.do")
	public ModelAndView deleteCode(HttpServletRequest rs) {

		ModelAndView mv = new ModelAndView("code");

		String main_cd = rs.getParameter("main_cd");


		HashMap<String, Object> commandMap = new HashMap<String, Object>();

		commandMap.put("main_cd", main_cd);

		List list = commonService.deleteCode(commandMap);

		//commonService.deleteCodeD(commandMap);

		//List listd = commonService.selectCodeDList(commandMap);

		mv.addObject("list", list);

		//mv.addObject("listd", listd);

		return mv;
	}

	@RequestMapping("/deleteDetail.do")
	public ModelAndView delete(HttpServletRequest rs) {

		ModelAndView mv = new ModelAndView("code");

		String main_cd = rs.getParameter("main_cd");
		String cd_nm = rs.getParameter("cd_nm");

		HashMap<String, Object> commandMap = new HashMap<String, Object>();

		commandMap.put("cd_nm", cd_nm);

		List list = commonService.selectCodeHList(commandMap);

		commandMap.put("main_cd", main_cd);

		commonService.deleteCodeD(commandMap);

		List listd = commonService.selectCodeDList(commandMap);

		mv.addObject("list", list);

		mv.addObject("listd", listd);

		return mv;
	}




}
