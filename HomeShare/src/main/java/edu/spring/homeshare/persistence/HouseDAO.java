package edu.spring.homeshare.persistence;

import java.util.List;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.util.PageCriteria;

public interface HouseDAO {
	HouseVO selectByTitle(String title);
	List<HouseVO> selectAll();
	int insert(HouseVO vo);
	HouseVO selectByHouseNo(int houseNo);
	int getTotalHouseNums();
	List<HouseVO> select(PageCriteria c	);
	List<HouseVO> selectAllByMemNo(int memNo);

}
