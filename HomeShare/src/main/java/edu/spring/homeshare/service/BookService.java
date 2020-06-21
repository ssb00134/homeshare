package edu.spring.homeshare.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.HouseVO;
@Service
public interface BookService {
	int create(BookVO vo); 
	List<BookVO> selectHouseNo(int houseNo);
	List<BookVO> selectMemNo(int memNo);
	int update(BookVO vo);
	int delete(int bookNo);
	List<BookVO> readOptionAndDate(HashMap<String, Object> map);
	List<BookVO> readByHostId(String bookHostId);
	List<BookVO> readByHostIdAcp(String bookHostId);
	List<BookVO> readByHostIdAcpLast(String bookHostId);
}
