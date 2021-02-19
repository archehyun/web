package web.common.util;

import java.util.Map;

public class MapUtil {

	public static String addParams(Map<String, Object> map, String strKeys) {

		String separator = "||";
		String strReturnData = "";

		String[] arrKeys = strKeys.trim().replaceAll(" ", "").split(",");

		if (arrKeys != null && arrKeys.length > 0) {
			for (int i = 0; i < arrKeys.length; i++) {
				strReturnData += getString(map, arrKeys[i]) + separator;
			}
		}

		return strReturnData;
	}

	public static String getString(Map<String, Object> map, String paramStr) {
		String s = "";
		Object obj = map.get(paramStr);
		if (obj == null) {
			return s;
		}
		return map.get(paramStr).toString();
	}

}
