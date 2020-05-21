package edu.spring.homeshare.persistence;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.HouseVO;

public interface BookDAO {
	int insert(BookVO vo);
}
