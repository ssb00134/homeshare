package edu.spring.homeshare.persistence;

import java.util.HashMap;
import java.util.List;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.HouseVO;

public interface BookDAO {
	List<BookVO> selectHouseNo(int houseNo);
	List<BookVO> selectMemNo(int memNo);
	int insert(BookVO vo);
	int update(BookVO vo);
	int delete(int bookNo);
	List<BookVO> selectOptionAndDate(HashMap<String, Object> map);
	
}
