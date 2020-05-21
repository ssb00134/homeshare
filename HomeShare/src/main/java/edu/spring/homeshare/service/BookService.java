package edu.spring.homeshare.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.HouseVO;
@Service
public interface BookService {
	int create(BookVO vo); 
	List<BookVO> selectHouseNo(int houseNo);
	List<BookVO> selectMemNo(int memNo);
}
