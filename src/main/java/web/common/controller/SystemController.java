package web.common.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import web.common.service.SystemService;
import web.common.util.CommUtil;

@Controller
@RequestMapping("/system/*")
public class SystemController {

	@Resource(name = "systemService")
	SystemService service;

	@RequestMapping("/program.do")
	public ModelAndView home(HttpServletRequest rs) {

		HashMap<String, Object> commandMap = new HashMap<String, Object>();

		List list = service.selectProgramList(commandMap);

		ModelAndView mv = new ModelAndView("program");

		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping("/insert.do")
	public ModelAndView insert(HttpServletRequest rs) throws UnsupportedEncodingException {


		ModelAndView mv = new ModelAndView("program");


		HashMap<String, Object> commandMap = new HashMap<String, Object>();
		String pg_id = CommUtil.getParam(rs, "pg_id");
		String pg_nm = CommUtil.getParam(rs, "pg_nm");
		String pg_src = CommUtil.getParam(rs, "pg_src");
		String pg_nm_eng = CommUtil.getParam(rs, "pg_nm_eng");

		commandMap.put("pg_id", pg_id);
		commandMap.put("pg_nm", pg_nm);
		commandMap.put("pg_src", pg_src);
		commandMap.put("pg_nm_eng", pg_nm_eng);

		List list = service.insertProgram(commandMap);

		mv.addObject("list", list);


		return mv;
	}

	@RequestMapping("/update.do")
	public ModelAndView update(HttpServletRequest rs) throws UnsupportedEncodingException {

		ModelAndView mv = new ModelAndView("program");

		HashMap<String, Object> commandMap = new HashMap<String, Object>();
		String pg_id = CommUtil.getParam(rs, "pg_id");
		String pg_nm = CommUtil.getParam(rs, "pg_nm");
		String pg_src = CommUtil.getParam(rs, "pg_src");
		String pg_nm_eng = CommUtil.getParam(rs, "pg_nm_eng");

		commandMap.put("pg_id", pg_id);
		commandMap.put("pg_nm", pg_nm);
		commandMap.put("pg_src", pg_src);
		commandMap.put("pg_nm_eng", pg_nm_eng);

		List list = service.updateProgram(commandMap);

		mv.addObject("list", list);


		return mv;
	}

	@RequestMapping("/delete.do")
	public ModelAndView delete(HttpServletRequest rs) throws UnsupportedEncodingException {

		ModelAndView mv = new ModelAndView("program");

		HashMap<String, Object> commandMap = new HashMap<String, Object>();
		String pg_id = CommUtil.getParam(rs, "pg_id");


		commandMap.put("pg_id", pg_id);

		List list = service.deleteProgram(commandMap);

		mv.addObject("list", list);


		return mv;
	}

}
