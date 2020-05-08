package edu.spring.homeshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.persistence.HouseDAO;
import edu.spring.homeshare.util.PageCriteria;
@Service
public class HouseServiceImple implements HouseService {

	@Autowired
	private HouseDAO HouseDao;
	
	@Override
	public HouseVO selectByTitle(String title) {
		return HouseDao.selectByTitle(title);
	}
	@Override
	public List<HouseVO> selectAll() {
		return HouseDao.selectAll();
	}
	@Override
	public int insert(HouseVO vo) {
		return HouseDao.insert(vo);
	}
	@Override
	public HouseVO selectByHouseNo(int houseNo) {
		return HouseDao.selectByHouseNo(houseNo);
	}

	@Override
	public List<HouseVO> selectAllByMemNO(int memNo) {
		return HouseDao.selectAllByMemNo(memNo);
	}
	@Override
	public List<HouseVO> read(PageCriteria criteria) {
		return HouseDao.select(criteria);
	}
	@Override
	public int getToTotalNumsOfRecords() {
		return HouseDao.getTotalNumsOfRecords();
	}

}
