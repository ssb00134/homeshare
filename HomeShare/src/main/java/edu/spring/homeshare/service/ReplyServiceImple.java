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
	public List<ReplyVO> read(int houseNo) {
		return replyDao.select(houseNo);
	}
	@Override
	public int readCount() {
		return replyDao.selectCount();
	}

}
