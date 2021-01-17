package com.spring.account.service;

import java.util.List;
import java.util.Map;

public interface AccountService {

	List<Map<String, Object>> selectAccountStaticList(Map<String, Object> commandMap);
	List<Map<String, Object>> selectAccountList(Map<String, Object> commandMap);

	List<Map<String, Object>> selectStaticList(Map<String, Object> commandMap);

	List insertAccount(Map<String, Object> commandMap);

	List deleteAccount(Map<String, Object> commandMap);

	List<Map<String, Object>> updateAccount(Map<String, Object> commandMap);

}
