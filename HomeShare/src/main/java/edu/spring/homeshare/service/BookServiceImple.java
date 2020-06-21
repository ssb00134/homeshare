package edu.spring.homeshare.service;

import java.util.HashMap;
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
	
	@Override
	public int delete(int bookNo) {
		// TODO Auto-generated method stub
		return BookDao.delete(bookNo);
	}
	@Override
	public int update(BookVO vo) {
		return BookDao.update(vo);
	}
	
	@Override
	public List<BookVO> readOptionAndDate(HashMap<String, Object> map) {
		return BookDao.selectOptionAndDate(map);
	}
	@Override
	public List<BookVO> readByHostId(String bookHostId) {
		return BookDao.selectByHostId(bookHostId);
	}
	
	@Override
	public List<BookVO> readByHostIdAcp(String bookHostId) {
		return BookDao.selectByHostIdAcp(bookHostId);
	}
	@Override
	public List<BookVO> readByHostIdAcpLast(String bookHostId) {
		return BookDao.selectByHostIdAcpLast(bookHostId);
	}
	//∆‰¿Ã¬°
	@Override
	public List<BookVO> readByHostId(HashMap<String, Object> map) {
		return BookDao.selectHostId(map);
	}
}
