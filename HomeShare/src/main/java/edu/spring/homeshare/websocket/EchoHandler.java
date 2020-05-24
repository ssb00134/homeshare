package edu.spring.homeshare.websocket;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import edu.spring.homeshare.controller.HouseController;

public class EchoHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} �����" , session.getId());
		System.out.println("ü�ù� ������ : " + session.getPrincipal().getName());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//list ����
		sessionList.remove(session);
		logger.info("{} ���� ���� " , session.getId());
		
	}
	
	
}