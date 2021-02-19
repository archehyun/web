package web.category.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import web.common.dao.CommonDAO;

@Service("commonService")
public class CommonServiceImpl implements CommonService {

	@Resource(name = "commonDAO")
	CommonDAO commonDAO;

	@Override
	public List selectCodeHList(HashMap<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return commonDAO.selectCodeHList(commandMap);
	}

	@Override
	public List selectCodeDList(HashMap<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return commonDAO.selectCodeDList(commandMap);
	}

	@Override
	public void deleteCodeD(HashMap<String, Object> commandMap) {
		commonDAO.deleteCodeD(commandMap);

	}

	@Override
	public List deleteCode(HashMap<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return commonDAO.deleteCode(commandMap);
	}

}
