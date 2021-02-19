package web.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import web.common.service.SystemService;
import web.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Resource(name = "memberService")
	MemberService service;

	@Resource(name = "systemService")
	SystemService systemService;

	@RequestMapping("/login.do")
	public ModelAndView login(HttpSession session, HttpServletRequest rs, HttpServletRequest request, HttpServletResponse response) {

		HashMap<String, Object> commandMap = new HashMap<String, Object>();

		String mem_id = rs.getParameter("loginId");

		String mem_pw = rs.getParameter("password");

		commandMap.put("mem_id", mem_id);

		Map<String, Object> member = service.selectMember(commandMap);

		try {
			ModelAndView mv = new ModelAndView();
			if (mem_pw.equals(member.get("mem_pw"))) {

				List list = systemService.selectUserProgramList(commandMap);
				mv = new ModelAndView("home");

				session.setAttribute("loginCheck", true);
				session.setAttribute("id", mem_id);

				mv.addObject("list", list);
				mv.addObject("mem_nm", member.get("mem_nm"));
			} else {
				mv = new ModelAndView("login");
				mv.addObject("errorMsg", "error");

			}

			return mv;

		} catch (Exception e) {
			e.printStackTrace();

		}

		return new ModelAndView();
	}

	@RequestMapping("/selectDetail.do")
	public ModelAndView selectDetail(HttpServletRequest rs) {


		HashMap<String, Object> commandMap = new HashMap<String, Object>();

		List list = service.selectMemberList(commandMap);

		String mem_id = rs.getParameter("mem_id");

		commandMap.put("mem_id", mem_id);
		List plist = systemService.selectUserProgramList(commandMap);

		ModelAndView mv = new ModelAndView("member");

		mv.addObject("list", list);
		mv.addObject("listd", plist);

		return mv;
	}

	@RequestMapping("/select.do")
	public ModelAndView select(HttpServletRequest rs) {

		HashMap<String, Object> commandMap = new HashMap<String, Object>();

		List list = service.selectMemberList(commandMap);

		String mem_id = rs.getParameter("mem_id");

		commandMap.put("mem_id", mem_id);
		System.out.println("mem_id:" + mem_id);
		List plist = systemService.selectUserProgramList(commandMap);


		ModelAndView mv = new ModelAndView("member");

		mv.addObject("list", list);
		mv.addObject("listd", plist);

		return mv;
	}

	@RequestMapping("/home.do")
	public ModelAndView home(HttpServletRequest rs) {

		HashMap<String, Object> commandMap = new HashMap<String, Object>();

		List list = service.selectMemberList(commandMap);

		String mem_id = rs.getParameter("mem_id");

		commandMap.put("mem_id", mem_id);

		List plist = systemService.selectUserProgramList(commandMap);

		ModelAndView mv = new ModelAndView("member");

		mv.addObject("list", list);
		mv.addObject("listd", plist);

		return mv;
	}

	@RequestMapping("/loginhome.do")
	public ModelAndView loginhome(HttpServletRequest rs) {

		ModelAndView mv = new ModelAndView("login");

		return mv;
	}

	@RequestMapping("/logout.do")
	public String logoutProcess(HttpSession session) {

		session.setAttribute("loginCheck", null);
		session.setAttribute("id", null);

		return "login";
	}

}
