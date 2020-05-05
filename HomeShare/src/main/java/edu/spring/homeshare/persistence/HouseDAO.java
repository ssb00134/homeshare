package edu.spring.homeshare.persistence;

import java.util.List;

import edu.spring.homeshare.domain.HouseVO;

public interface HouseDAO {
	HouseVO selectByTitle(String title);
	List<HouseVO> selectAll();
}
