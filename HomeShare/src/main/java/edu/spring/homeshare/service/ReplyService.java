package edu.spring.homeshare.service;

import java.util.List;

import edu.spring.homeshare.domain.ReplyVO;

public interface ReplyService {
	int create(ReplyVO vo);
	List<ReplyVO> read(int houseNo);
	int readCount();
	int update(ReplyVO vo);
	int delete(int rno);
	double readAvgScore(int houseNo);
	
	int readCountHouseNo(int houseNo);
}
