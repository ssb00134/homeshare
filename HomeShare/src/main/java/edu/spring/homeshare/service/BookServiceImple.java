package edu.spring.homeshare.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.persistence.BookDAO;
import edu.spring.homeshare.persistence.HouseDAOImple;

@Service
public class BookServiceImple implements BookService {
	Logger logger = LoggerFactory.getLogger(HouseDAOImple.class);

	@Autowired
	private BookDAO BookDao;

	@Override
	public int create(BookVO vo) {
		return BookDao.insert(vo);
	}

	
	@Override
	public List<BookVO> selectHouseNo(int houseNo) {
		return BookDao.selectHouseNo(houseNo);
	}
	@Override
	public List<BookVO> selectMemNo(int memNo) {
		return BookDao.selectMemNo(memNo);
	}
}
