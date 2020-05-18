package edu.spring.homeshare.persistence;

import java.util.List;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.util.PageCriteria;

public interface HouseDAO {
	HouseVO selectByTitle(String title);
	List<HouseVO> selectAll();
	int insert(HouseVO vo);
	HouseVO selectByHouseNo(int houseNo);
	List<HouseVO> select(PageCriteria c	);
	List<HouseVO> selectAllByMemNo(int memNo);
	int getTotalNumsOfRecords();
	int getCountHouseByMemNo(int memNo);
	//주소검색
	List<HouseVO> select(String location);

}
