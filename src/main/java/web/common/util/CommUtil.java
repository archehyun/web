package web.common.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;

public class CommUtil {

	public static String getParam(HttpServletRequest rs, String name) throws UnsupportedEncodingException {
		String param = rs.getParameter(name);
		if (param == null) {
			return "";
		} else

		{
			return URLDecoder.decode(rs.getParameter(name), "UTF-8");
		}
	}

}
