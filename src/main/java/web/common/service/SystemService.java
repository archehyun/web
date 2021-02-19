package web.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface SystemService {

	List<Map<String, Object>> selectProgramList(Map<String, Object> commandMap);

	List<Map<String, Object>> selectUserProgramList(Map<String, Object> commandMap);

	List<Map<String, Object>> selectCodeList(Map<String, Object> commandMap);

	List<Map<String, Object>> insertProgram(Map<String, Object> commandMap);

	List deleteProgram(Map<String, Object> commandMap);

	List updateProgram(HashMap<String, Object> commandMap);

}
