package edu.spring.homeshare.persistence;

import java.util.HashMap;
import java.util.List;

import edu.spring.homeshare.domain.ReportVO;


public interface ReportDAO {
	int insert(ReportVO vo);
	List<ReportVO> select(int houseNo);
	List<ReportVO> select();
	List<ReportVO> select(HashMap<String, Object> map);
	int getCountByHouseNo(int houseNo);
	
	List<ReportVO> selectHostId(HashMap<String, Object> map);
	int getCountByHostId(String hostId);
	
	int delete(int reportNo);
}
