package edu.spring.homeshare.service;

import java.util.List;

import edu.spring.homeshare.domain.HouseVO;

public interface HouseService {
	HouseVO selectByTitle(String title);
	List<HouseVO> selectAll();
}
