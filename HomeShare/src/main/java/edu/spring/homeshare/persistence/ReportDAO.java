package edu.spring.homeshare.persistence;

import java.util.List;

import edu.spring.homeshare.domain.ReportVO;


public interface ReportDAO {
	int insert(ReportVO vo);
	List<ReportVO> select(int houseNo);
	List<ReportVO> select();
}
