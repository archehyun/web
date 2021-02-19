package web.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("systemDAO")
public class SystemDAO extends AbstractDAO {

	public List<Map<String, Object>> selectProgramList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return selectList("program.selectProgramList", commandMap);
	}

	public Object updateProgram(Map<String, Object> commandMap) {

		return update("program.updateProgram", commandMap);
	}

	public Object deleteProgram(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return delete("program.deleteProgram", commandMap);
	}

	public Object insertProgram(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return insert("program.insertProgram", commandMap);
	}

	public List<Map<String, Object>> selectCodeList(Map<String, Object> commandMap) {
		return null;
	}

	public List<Map<String, Object>> selectUserProgramList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return selectList("memer.selectUserProgramList", commandMap);
	}

}
