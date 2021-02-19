package web.category.service;

import java.util.HashMap;
import java.util.List;

public interface CommonService {

	public List selectCodeHList(HashMap<String, Object> commandMap);

	public List selectCodeDList(HashMap<String, Object> commandMap);

	public void deleteCodeD(HashMap<String, Object> commandMap);

	public List deleteCode(HashMap<String, Object> commandMap);

}
