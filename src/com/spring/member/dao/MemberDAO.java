package com.spring.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {

	public Map<String, Object> selectMember(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("memer.selectMember", commandMap);
	}

	public List selectMemberList(HashMap<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return selectList("memer.selectMemberList", commandMap);
	}

}
