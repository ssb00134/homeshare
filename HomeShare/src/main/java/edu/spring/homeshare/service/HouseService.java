package edu.spring.homeshare.service;

import java.util.List;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.util.PageCriteria;

public interface HouseService {
	HouseVO selectByTitle(String title);
	List<HouseVO> selectAll();
	int create(HouseVO vo);
	HouseVO selectByHouseNo(int houseNo);
	List<HouseVO> selectAllByMemNO(int memNo);
	List<HouseVO> read(PageCriteria criteria);
	int getToTotalNumsOfRecords();
}
