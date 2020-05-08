package edu.spring.homeshare.service;

import java.util.List;

import edu.spring.homeshare.domain.ReplyVO;

public interface ReplyService {
	List<ReplyVO> read(int houseNo);
	int readCount();
}
