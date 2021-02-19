package web.account.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import web.account.dao.AccountDAO;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Resource(name = "accountDAO")
	private AccountDAO accountDAO;

	public List<Map<String, Object>> selectAccountList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return accountDAO.selectAccountList(commandMap);
	}

	public List insertAccount(Map<String, Object> commandMap) {

		return accountDAO.insertAccount(commandMap);

	}

	public List deleteAccount(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return accountDAO.deleteAccount(commandMap);
	}

	public List<Map<String, Object>> selectStaticList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return accountDAO.selectStaticList(commandMap);
	}

	public List<Map<String, Object>> updateAccount(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return accountDAO.updateAccount(commandMap);
	}

	public List<Map<String, Object>> selectAccountStaticList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return accountDAO.selectAccountStaticList(commandMap);
	}

}
