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
	// WebSocket���� �������� �����ϸ� ��û�Ǵ� �Լ�
	@OnOpen
	public void handleOpen(Session userSession) {
		// �ֿܼ� ���� �α׸� ����Ѵ�.
		System.out.println("client is now connected..." + userSession);
		sessionUser.add(userSession);
	}

	// WebSocket���� �޽����� ���� ��û�Ǵ� �Լ�
	@OnMessage
	public void handleMessage(String message) {
		// �޽��� ������ �ֿܼ� ����Ѵ�.
		System.out.println("receive from client : " + message);
		// ���� �޽����� �ۼ��Ѵ�.
		String replymessage = "echo " + message;
		// ���� �޽����� �ֿܼ� ����Ѵ�.
		System.out.println("send to client : " + replymessage);
		// ���� �޽����� �������� ������.
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

	// WebSocket�� �������� ������ ����� ��û�Ǵ� �Լ�
	@OnClose
	public void handleClose(Session userSession) {
		// �ֿܼ� ���� ���� �α׸� ����Ѵ�.
		sessionUser.remove(userSession);
		System.out.println("client is now disconnected...");
	}

	// WebSocket�� ������ ���� ��� ������ �߻��ϸ� ��û�Ǵ� �Լ�.
	@OnError
	public void handleError(Throwable t) {
	// �ֿܼ� ������ ǥ���Ѵ�.
	t.printStackTrace();
	}


}
