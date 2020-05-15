package edu.spring.homeshare.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.persistence.HouseDAO;
import edu.spring.homeshare.persistence.HouseDAOImple;
import edu.spring.homeshare.util.PageCriteria;
@Service
public class HouseServiceImple implements HouseService {
	
	Logger logger = LoggerFactory.getLogger(HouseDAOImple.class);

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
	public int create(HouseVO vo) {
		logger.info("create ½ÇÇà");
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
	@Override
	public int getCountByMemNo(int memNo) {
		return HouseDao.getCountHouseByMemNo(memNo);
	}

}
