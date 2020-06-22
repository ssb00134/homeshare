package edu.spring.homeshare.persistence;

import java.util.HashMap;
import java.util.List;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.ReplyVO;
import edu.spring.homeshare.domain.ReportVO;

public interface ReplyDAO {
	int insert(ReplyVO vo);
	List<ReplyVO> select(int houseNo);
	int selectCount();
	int update(ReplyVO vo);
	int delete(int rno);
	
	int selectCountByHouseNo(int houseNo); //houseno를 기준으로 일치하는 갯수 리턴
	
	double selectAvgScore(int houseNo);

	
}
