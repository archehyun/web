package com.spring.category.service;

import java.util.List;
import java.util.Map;

public interface BaseService {


	List<Map<String, Object>> selectGubun(Map<String, Object> commandMap);

	List<Map<String, Object>> updateGubun(Map<String, Object> commandMap);

	List<Map<String, Object>> insertGubun(Map<String, Object> commandMap);

	List<Map<String, Object>> deleteGubun(Map<String, Object> commandMap);

}
