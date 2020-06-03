package edu.spring.homeshare.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	List<HouseVO> select(HashMap<String, Object> map );
	//List<HouseVO> select(PageCriteria c,HashMap<String, Object> map );
	
	int getTotalNumsOfRecords(Map<String, Object> map);
	
	int update(int houseNo);
	int delte(int houseNo);
	
	int selectSeqence(); //houseNo 가장 높은 것을 리턴
	int update(HouseVO vo);
	
	List<HouseVO> selectSingle(HashMap<String, Object> map);

}
