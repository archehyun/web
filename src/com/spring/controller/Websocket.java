package com.spring.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@ServerEndpoint("/websocket")
public class Websocket {

	static List<Session> sessionUser = Collections.synchronizedList(new ArrayList<Session>());
	// WebSocket으로 브라우저가 접속하면 요청되는 함수
	@OnOpen
	public void handleOpen(Session userSession) {
		// 콘솔에 접속 로그를 출력한다.
		System.out.println("client is now connected..." + userSession);
		sessionUser.add(userSession);
	}

	// WebSocket으로 메시지가 오면 요청되는 함수
	@OnMessage
	public void handleMessage(String message) {
		// 메시지 내용을 콘솔에 출력한다.
		System.out.println("receive from client : " + message);
		// 에코 메시지를 작성한다.
		String replymessage = "echo " + message;
		// 에코 메시지를 콘솔에 출력한다.
		System.out.println("send to client : " + replymessage);
		// 에코 메시지를 브라우저에 보낸다.
		sendMessage(message);

	}

	private void sendMessage(String message) {
		Iterator<Session> iter = sessionUser.iterator();
		System.out.println("send Message:" + message);
		while (iter.hasNext()) {
			try {
				Session session = iter.next();
				session.getBasicRemote().sendText(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/api", method = { RequestMethod.GET, RequestMethod.POST })
	public String home(HttpServletRequest request, @RequestParam("name") String name, @RequestParam("temp") String temp, @RequestParam("hit") String hit) throws Exception {
		JSONObject json = new JSONObject();

		json.put("success", true);
		json.put("name", name);
		json.put("temp", temp);
		json.put("hit", hit);

		sendMessage(json.toJSONString());

		return json.toJSONString();
	}

	// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose(Session userSession) {
		// 콘솔에 접속 끊김 로그를 출력한다.
		sessionUser.remove(userSession);
		System.out.println("client is now disconnected...");
	}

	// WebSocket과 브라우저 간에 통신 에러가 발생하면 요청되는 함수.
	@OnError
	public void handleError(Throwable t) {
	// 콘솔에 에러를 표시한다.
	t.printStackTrace();
	}


}
