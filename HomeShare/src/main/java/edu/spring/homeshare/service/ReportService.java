package edu.spring.homeshare.service;

import java.util.List;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.ReportVO;

public interface ReportService {
	int create(ReportVO vo);
	List<ReportVO> read(int houseNo);
	List<ReportVO> read();
}
