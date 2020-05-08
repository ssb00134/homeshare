package edu.spring.homeshare.persistence;

import java.util.List;

import edu.spring.homeshare.domain.ReplyVO;

public interface ReplyDAO {
	List<ReplyVO> select(int houseNo);
	int selectCount();
}
