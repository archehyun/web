package web.common.controller;

import java.io.UnsupportedEncodingException;

import org.apache.log4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionAdvice {

	private static final Logger logger = Logger.getLogger(CommonExceptionAdvice.class);

	@ExceptionHandler(RuntimeException.class)
	public String errorException(Model model, Exception e) {

		logger.info("exception : " + e.getMessage());

		model.addAttribute("exception", e);

		return "error/exception";

	}

	@ExceptionHandler(UnsupportedEncodingException.class)
	public String exceptionHandler2(Model model, Exception e) {

		logger.info("exception : " + e.getMessage());

		model.addAttribute("exception", e);

		return "error/exception";

	}

}
