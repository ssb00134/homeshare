package edu.spring.homeshare.persistence;

import java.util.List;

import edu.spring.homeshare.domain.ReplyVO;

public interface ReplyDAO {
	int insert(ReplyVO vo);
	List<ReplyVO> select(int houseNo);
	int selectCount();
	int update(ReplyVO vo);
	int delete(int rno);
	
	int selectAvgScore(int houseNo);
	
}
