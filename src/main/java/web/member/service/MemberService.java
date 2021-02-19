package web.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MemberService {

	Map<String, Object> selectMember(Map<String, Object> commandMap);

	List selectMemberList(HashMap<String, Object> commandMap);

}
