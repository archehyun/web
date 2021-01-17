package com.spring.category.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.category.service.BaseService;
import com.spring.common.util.CommUtil;
import com.spring.common.util.MapUtil;

@Controller
@RequestMapping("/category/*")
public class CategoryController {

	@Resource(name = "baseService")
	private BaseService baseService;

	@RequestMapping("/home.do")
	public ModelAndView home(HttpServletRequest rs) {

		ModelAndView mv = new ModelAndView("category", "msg", "");
		System.out.println("home");

		return mv;
	}

	@RequestMapping("/select.do")
	public ModelAndView select(HttpServletRequest rs) {

		ModelAndView mv = new ModelAndView("category", "msg", "");

		try {

			String inout_type = CommUtil.getParam(rs, "inout_type");

			Map<String, Object> commandMap = new HashMap<String, Object>();
			commandMap.put("inout_type", inout_type);
			List<Map<String, Object>> gubun = baseService.selectGubun(commandMap);

			mv.addObject("list", gubun);

			mv.addObject("inout_type", inout_type);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping("/insert.do")
	public ModelAndView insert(HttpServletRequest rs) {
		ModelAndView mv = new ModelAndView("category", "msg", "");

		try {

			Map<String, Object> commandMap = new HashMap<String, Object>();
			String gubun_cd = CommUtil.getParam(rs, "gubun_cd");
			String gubun_nm = CommUtil.getParam(rs, "gubun_nm");
			String inout_type = CommUtil.getParam(rs, "inout_type");
			String input_inout_type = CommUtil.getParam(rs, "input_inout_type");
			String item1 = CommUtil.getParam(rs, "item1");
			String item2 = CommUtil.getParam(rs, "item2");
			String item3 = CommUtil.getParam(rs, "item3");

			commandMap.put("gubun_cd", gubun_cd);
			commandMap.put("gubun_nm", gubun_nm);
			commandMap.put("inout_type", inout_type);
			commandMap.put("input_inout_type", input_inout_type);
			commandMap.put("item1", item1);
			commandMap.put("item2", item2);
			commandMap.put("item3", item3);

			System.out.println("input_inout_type:" + input_inout_type);

			Map<String, Object> ds_cond = new HashMap<String, Object>();

			ds_cond.put("gubun_cd", gubun_cd);
			ds_cond.put("gubun_nm", gubun_nm);
			ds_cond.put("inout_type", inout_type);
			ds_cond.put("input_inout_type", input_inout_type);
			ds_cond.put("item1", item1);
			ds_cond.put("item2", item2);
			ds_cond.put("item3", item3);

			commandMap.put("PD_VALUE1", MapUtil.addParams(ds_cond, "gubun_cd,gubun_nm,input_inout_type,inout_type,item1,item2,item3"));

			List<Map<String, Object>> gubun = baseService.insertGubun(commandMap);

			mv.addObject("list", gubun);
			mv.addObject("inout_type", inout_type);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/delete.do")
	public ModelAndView delete(HttpServletRequest rs) {
		ModelAndView mv = new ModelAndView("category", "msg", "");

		try {

			Map<String, Object> commandMap = new HashMap<String, Object>();
			String gubun_cd = CommUtil.getParam(rs, "gubun_cd");

			String inout_type = CommUtil.getParam(rs, "inout_type");

			commandMap.put("gubun_cd", gubun_cd);
			commandMap.put("inout_type", inout_type);

			Map<String, Object> ds_cond = new HashMap<String, Object>();

			ds_cond.put("gubun_cd", gubun_cd);

			commandMap.put("PD_VALUE1", MapUtil.addParams(ds_cond, "gubun_cd,gubun_nm,inout_type,item1,item2,item3"));

			List<Map<String, Object>> gubun = baseService.deleteGubun(commandMap);

			mv.addObject("list", gubun);
			mv.addObject("inout_type", inout_type);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/update.do")
	public ModelAndView update(HttpServletRequest rs) {

		ModelAndView mv = new ModelAndView("category", "msg", "");


		try {
			Map<String, Object> commandMap = new HashMap<String, Object>();
			String gubun_cd = CommUtil.getParam(rs, "gubun_cd");
			String gubun_nm = CommUtil.getParam(rs, "gubun_nm");
			String inout_type = CommUtil.getParam(rs, "inout_type");
			String input_inout_type = CommUtil.getParam(rs, "input_inout_type");
			String item1 = CommUtil.getParam(rs, "item1");
			String item2 = CommUtil.getParam(rs, "item2");
			String item3 = CommUtil.getParam(rs, "item3");

			commandMap.put("gubun_cd", gubun_cd);
			commandMap.put("gubun_nm", gubun_nm);
			commandMap.put("inout_type", inout_type);
			commandMap.put("input_inout_type", input_inout_type);
			commandMap.put("item1", item1);
			commandMap.put("item2", item2);
			commandMap.put("item3", item3);

			Map<String, Object> ds_cond = new HashMap<String, Object>();

			ds_cond.put("gubun_cd", gubun_cd);
			ds_cond.put("gubun_nm", gubun_nm);
			ds_cond.put("inout_type", inout_type);
			ds_cond.put("item1", item1);
			ds_cond.put("item2", item2);
			ds_cond.put("item3", item3);

			System.out.println("cd:" + gubun_cd + ",input_inout_type:" + input_inout_type);

			commandMap.put("PD_VALUE1", MapUtil.addParams(ds_cond, "gubun_cd,gubun_nm,inout_type,item1,item2,item3"));

			List<Map<String, Object>> gubun = baseService.updateGubun(commandMap);

			mv.addObject("list", gubun);
			mv.addObject("inout_type", inout_type);


		} catch (Exception e) {
			e.printStackTrace();

		}



		return mv;
	}

	@RequestMapping("/selectDetail.do")
	public ModelAndView detail(HttpServletRequest rs) {

		ModelAndView mv = new ModelAndView("category", "msg", "");

		Map<String, Object> commandMap = new HashMap<String, Object>();

		List<Map<String, Object>> gubun = baseService.selectGubun(commandMap);

		mv.addObject("list", gubun);

		return mv;
	}

}
