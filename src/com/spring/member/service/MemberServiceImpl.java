package com.spring.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name = "memberDAO")
	MemberDAO memberDAO;

	@Override
	public Map<String, Object> selectMember(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return memberDAO.selectMember(commandMap);
	}

	@Override
	public List selectMemberList(HashMap<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberList(commandMap);
	}

}
