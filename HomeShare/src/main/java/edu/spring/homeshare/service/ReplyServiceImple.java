package edu.spring.homeshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.homeshare.domain.ReplyVO;
import edu.spring.homeshare.persistence.ReplyDAO;

@Service
public class ReplyServiceImple implements ReplyService {
	@Autowired
	private ReplyDAO replyDao;
	
	@Override
	public int create(ReplyVO vo) {
		return replyDao.insert(vo);
	}
	
	@Override
	public List<ReplyVO> read(int houseNo) {
		return replyDao.select(houseNo);
	}
	@Override
	public int readCount() {
		return replyDao.selectCount();
	}
	@Override
	public int update(ReplyVO vo) {
		return replyDao.update(vo);
	}
	@Override
	public int delete(int rno) {
		return replyDao.delete(rno);
	}
	@Override
	public int readAvgScore(int houseNo) {
		return replyDao.selectAvgScore(houseNo);
	}
	
	@Override
	public int readCountHouseNo(int houseNo) {
		return replyDao.selectCountByHouseNo(houseNo);
	}

}
