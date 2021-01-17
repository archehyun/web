package com.spring.account.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.account.service.AccountService;
import com.spring.category.service.BaseService;
import com.spring.common.util.CommUtil;
import com.spring.common.util.MapUtil;


/* Name : account
 *
 */

@Controller
@RequestMapping("/account/*")
public class AccountController {

	@Resource(name = "accountService")
	private AccountService accountService;

	@Resource(name = "baseService")
	private BaseService baseService;

	@RequestMapping("/home.do")
	public ModelAndView home(HttpServletRequest rs) {

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
		SimpleDateFormat format2 = new SimpleDateFormat("MM");

		ModelAndView mv = new ModelAndView("account", "msg", "");

		try {
			String inout_type=CommUtil.getParam(rs, "inout_type");
			String gubun_cd = CommUtil.getParam(rs, "gubun_cd");

			if (inout_type == null || inout_type.equals("")) {
				inout_type = "o";
			}

			Map<String, Object> commandMap = new HashMap<String, Object>();

			Date time = new Date();

			String input_year = format1.format(time);
			String input_month = format2.format(time);

			commandMap.put("input_year", input_year);

			commandMap.put("input_month", input_month);

			commandMap.put("inout_type", inout_type);

			commandMap.put("gubun_cd", gubun_cd);

			List<Map<String, Object>> gubun = baseService.selectGubun(commandMap);

			mv.addObject("gubun", gubun);

			mv.addObject("input_year", input_year);

			mv.addObject("inout_type", inout_type);

			mv.addObject("input_month", input_month);

			System.out.println("input_year:" + input_year + ",input_month:" + input_month + " ,inout_type:" + inout_type + ":" + gubun);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping("/tab.do")
	public String tap(Model model, HttpServletRequest rs) {
		try {
			String inout_type = CommUtil.getParam(rs, "inout_type");
			String input_year = CommUtil.getParam(rs, "input_year");
			String input_month = CommUtil.getParam(rs, "input_month");

			Map<String, Object> commandMap = new HashMap<String, Object>();
			commandMap.put("inout_type", inout_type);
			List<Map<String, Object>> gubun = baseService.selectGubun(commandMap);
			System.out.println("tab select:" + inout_type + ", input_yser:" + input_year + ", input_month:" + input_month);
			model.addAttribute("inout_type", inout_type);
			model.addAttribute("input_year", input_year);
			model.addAttribute("input_month", input_month);
			model.addAttribute("gubun", gubun);
		}
		catch (Exception e) {
			e.printStackTrace();
		}


		return "account";
	}

	@RequestMapping("/insert.do")
	public ModelAndView insert(HttpServletRequest rs, HttpSession session) {

		ModelAndView mv = new ModelAndView("account", "msg", "");
		try {

			Map<String, Object> commandMap = new HashMap<String, Object>();

			String gubun_cd = CommUtil.getParam(rs, "input_gubun_cd");
			String inout_type = CommUtil.getParam(rs, "inout_type");
			String contents = CommUtil.getParam(rs, "contents");
			String input_value = CommUtil.getParam(rs, "input_value");
			String input_date = CommUtil.getParam(rs, "input_date");
			String ur_id = (String) session.getAttribute("id");

			String input_year = CommUtil.getParam(rs, "input_year");
			String input_month = CommUtil.getParam(rs, "input_month");

			System.out.println("input_value:" + input_value + ",inout_type:" + inout_type + ",input_date:" + input_date + ",content:" + contents + ",input_year:" + input_year + ", input_month:" + input_month);

			commandMap.put("input_value", Integer.parseInt(input_value));
			commandMap.put("contents", contents);
			commandMap.put("inout_type", inout_type);
			commandMap.put("gubun_cd", inout_type);
			commandMap.put("input_date", input_date);
			commandMap.put("input_month", input_month);
			commandMap.put("input_year", input_year);


			Map<String, Object> ds_cond = new HashMap<String, Object>();

			ds_cond.put("input_value", Integer.parseInt(input_value));
			ds_cond.put("contents", contents);
			ds_cond.put("inout_type", inout_type);
			ds_cond.put("gubun_cd", gubun_cd);
			ds_cond.put("input_date", input_date);
			ds_cond.put("input_month", input_month);
			ds_cond.put("input_year", input_year);
			ds_cond.put("ur_id", ur_id);


			commandMap.put("PD_VALUE1", MapUtil.addParams(ds_cond, "input_value,contents,inout_type,gubun_cd,input_date,input_year,input_month,ur_id"));

			//		commandMap.put("totals", 1);

			List<Map<String, Object>> gubun = baseService.selectGubun(commandMap);


			//mv.addObject("type", type);

			List<Map<String, Object>> list = accountService.insertAccount(commandMap);
			mv.addObject("list", list);
			mv.addObject("gubun", gubun);
			mv.addObject("gubun_cd", gubun_cd);
			mv.addObject("inout_type", inout_type);
			mv.addObject("input_month", input_month);
			mv.addObject("input_year", input_year);
			mv.addObject("input_date", input_date);

			return mv;

		} catch (Exception e) {
			e.printStackTrace();
			return mv;
		}

	}

	@RequestMapping("/update.do")
	public ModelAndView update(HttpServletRequest rs, HttpSession session) {

		ModelAndView mv = new ModelAndView("account", "msg", "");
		try {

			Map<String, Object> commandMap = new HashMap<String, Object>();


			String idx = CommUtil.getParam(rs, "idx");
			String input_value = CommUtil.getParam(rs, "input_value");
			String contents = CommUtil.getParam(rs, "contents");
			String inout_type = CommUtil.getParam(rs, "inout_type");

			String gubun_cd = CommUtil.getParam(rs, "gubun_cd");
			String input_gubun_cd = CommUtil.getParam(rs, "input_gubun_cd");
			String input_date = CommUtil.getParam(rs, "input_date");

			String input_year = CommUtil.getParam(rs, "input_year");
			String input_month = CommUtil.getParam(rs, "input_month");
			String ur_id = (String) session.getAttribute("id");

			System.out.println("idx:" + idx + ",input_value:" + input_value + ",inout_type:" + inout_type + ",input_date:" + input_date + ",content:" + contents);

			commandMap.put("idx", idx);
			commandMap.put("input_value", Integer.parseInt(input_value));
			commandMap.put("contents", contents);
			commandMap.put("inout_type", inout_type);
			commandMap.put("gubun_cd", gubun_cd);
			commandMap.put("input_gubun_cd", input_gubun_cd);
			commandMap.put("input_date", input_date);
			commandMap.put("input_year", input_year);
			commandMap.put("input_month", input_month);

			Map<String, Object> ds_cond = new HashMap<String, Object>();

			ds_cond.put("idx", idx);
			ds_cond.put("input_value", Integer.parseInt(input_value));
			ds_cond.put("contents", contents);
			ds_cond.put("inout_type", inout_type);
			ds_cond.put("gubun_cd", gubun_cd);
			ds_cond.put("input_gubun_cd", input_gubun_cd);
			ds_cond.put("input_date", input_date);
			ds_cond.put("input_year", input_year);
			ds_cond.put("input_month", input_month);
			ds_cond.put("ur_id", ur_id);

			commandMap.put("PD_VALUE1", MapUtil.addParams(ds_cond, "idx,input_value,contents,inout_type,input_gubun_cd,input_date,input_year,input_month,ur_id"));

			//		commandMap.put("totals", 1);

			List<Map<String, Object>> gubun = baseService.selectGubun(commandMap);

			//mv.addObject("type", type);

			List<Map<String, Object>> list = accountService.updateAccount(commandMap);
			mv.addObject("list", list);
			mv.addObject("gubun", gubun);
			mv.addObject("gubun_cd", gubun_cd);
			mv.addObject("inout_type", inout_type);
			mv.addObject("input_month", input_month);
			mv.addObject("input_year", input_year);
			mv.addObject("input_date", input_date);

			return mv;

		} catch (Exception e) {
			e.printStackTrace();
			return mv;
		}

	}



	@RequestMapping(value = "/select.do")
	public ModelAndView account(HttpServletRequest rs, HttpSession session) {

		ModelAndView mv = new ModelAndView("account");
		try {

			Map<String, Object> commandMap = new HashMap<String, Object>();

			String inout_type = CommUtil.getParam(rs, "inout_type");
			String gubun_cd = CommUtil.getParam(rs, "gubun_cd");
			String input_date = CommUtil.getParam(rs, "input_date");
			String input_year = CommUtil.getParam(rs, "input_year");
			String input_month = CommUtil.getParam(rs, "input_month");
			String searchVal = CommUtil.getParam(rs, "searchVal");
			String ur_id = (String) session.getAttribute("id");
			//System.out.println("inout_type:" + inout_type + ",gubun_cd:" + gubun_cd + ", input_year:" + input_date);

			commandMap.put("inout_type", inout_type);
			commandMap.put("gubun_cd", gubun_cd);
			commandMap.put("input_date", input_date);
			commandMap.put("value", searchVal);

			commandMap.put("ur_id", ur_id);

			Map<String, Object> ds_cond = new HashMap<String, Object>();

			ds_cond.put("value", searchVal);

			ds_cond.put("inout_type", inout_type);
			ds_cond.put("gubun_cd", gubun_cd);
			ds_cond.put("input_date", input_date);
			ds_cond.put("ur_id", ur_id);

			commandMap.put("PD_VALUE1", MapUtil.addParams(ds_cond, "value,inout_type,gubun_cd,input_date,ur_id"));

			commandMap.put("total", 0);

			List<Map<String, Object>> list = accountService.selectAccountList(commandMap);



			commandMap.put("total_sum", 0);

			commandMap.put("PD_VALUE1", MapUtil.addParams(ds_cond, "inout_type,input_date,ur_id"));

			//  통계 정보

			List<Map<String, Object>> sub_list = accountService.selectAccountStaticList(commandMap);

			if (sub_list.size() > 0)
			mv.addObject("sum", sub_list.get(0).get("total_sum"));

			List<Map<String, Object>> gubun_list = baseService.selectGubun(commandMap);

			mv.addObject("sub_list", sub_list);
			mv.addObject("inout_type", inout_type);
			mv.addObject("list", list);
			mv.addObject("gubun", gubun_list);
			mv.addObject("gubun_cd", gubun_cd);
			mv.addObject("input_date", input_date);
			mv.addObject("input_month", input_month);
			mv.addObject("input_year", input_year);
			mv.addObject("total", input_year);

		} catch (Exception e) {
			e.printStackTrace();
			return mv;
		}

		return mv;
	}

	@RequestMapping(value = "/delete.do")
	public ModelAndView delete(HttpServletRequest rs, HttpSession session) {
		ModelAndView mv = new ModelAndView("account");

		try {
			String inout_type = rs.getParameter("inout_type");
			String gubun_cd = CommUtil.getParam(rs, "gubun_cd");
			String idx = rs.getParameter("idx");


			String input_year = CommUtil.getParam(rs, "input_year");
			String input_month = CommUtil.getParam(rs, "input_month");
			String ur_id = (String) session.getAttribute("id");


			Map<String, Object> commandMap = new HashMap<String, Object>();

			commandMap.put("inout_type", inout_type);
			commandMap.put("gubun_cd", gubun_cd);
			Map<String, Object> ds_cond = new HashMap<String, Object>();
			ds_cond.put("value", "1");
			ds_cond.put("inout_type", inout_type);
			ds_cond.put("gubun_cd", gubun_cd);
			ds_cond.put("idx", idx);
			ds_cond.put("input_year", input_year);
			ds_cond.put("input_month", input_month);
			ds_cond.put("ur_id", ur_id);

			commandMap.put("PD_VALUE1", MapUtil.addParams(ds_cond, "value, inout_type,gubun_cd, idx,input_year,input_month,ur_id"));
			commandMap.put("total", 0);

			//System.out.println("PD_VALUE1:" + commandMap.get("PD_VALUE1") + ", total:" + commandMap.get("total"));

			List<Map<String, Object>> list = accountService.deleteAccount(commandMap);

			List<Map<String, Object>> gubun_list = baseService.selectGubun(commandMap);

			mv.addObject("gubun", gubun_list);
			mv.addObject("gubun_cd", gubun_cd);
			mv.addObject("list", list);
			mv.addObject("input_month", input_month);
			mv.addObject("input_year", input_year);
			mv.addObject("inout_type", inout_type);
		} catch (Exception e) {
			e.printStackTrace();
			return mv;
		}


		return mv;
	}

	@RequestMapping(value = "/static.do")
	public ModelAndView staticView(HttpServletRequest rs, HttpSession session) {

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy");

		String input_year = format1.format(new Date());

		ModelAndView mv = new ModelAndView("staticView");

		String ur_id = (String) session.getAttribute("id");

		Map<String, Object> commandMap =new HashMap<String, Object>();

		commandMap.put("inout_type", "i");

		commandMap.put("ur_id", ur_id);

		commandMap.put("dt_year", rs.getParameter("dt_year"));

		List<Map<String, Object>> in_list = accountService.selectStaticList(commandMap);

		commandMap.put("inout_type", "o");

		List<Map<String, Object>> out_list = accountService.selectStaticList(commandMap);

		Map<String, Object> sum_list = new HashMap<String, Object>();

		if (in_list.size() > 0 && out_list.size() > 0) {

			Map in_last = in_list.get(in_list.size() - 1);

			Map out_last = out_list.get(out_list.size() - 1);

			Iterator iter = in_last.keySet().iterator();
			while (iter.hasNext()) {
				String in_key = (String) iter.next();
				String varInLast = (String) in_last.get(in_key);
				String varOutLast = (String) out_last.get(in_key);
				int in_total = Integer.parseInt(varInLast.replace(",", ""));
				int out_total = Integer.parseInt(varOutLast.replace(",", ""));

				int sum = in_total - out_total;

				sum_list.put(in_key, sum);

			}

		}

		out_list.add(sum_list);

		mv.addObject("in_list", in_list);

		mv.addObject("out_list", out_list);

		mv.addObject("input_year", input_year);

		mv.addObject("input_year", input_year);


		return mv;
	}

	@RequestMapping(value = "/gubun.do")
	public ModelAndView category(HttpServletRequest rs) {

		ModelAndView mv = new ModelAndView("category");

		return mv;
	}

}
