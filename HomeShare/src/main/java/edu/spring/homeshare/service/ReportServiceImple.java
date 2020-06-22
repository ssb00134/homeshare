package edu.spring.homeshare.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.ReportVO;
import edu.spring.homeshare.persistence.ReportDAO;

@Service
public class ReportServiceImple implements ReportService{
	@Autowired
	private ReportDAO reportDao;
	@Override
	public int create(ReportVO vo) {
		return reportDao.insert(vo);
	}
	@Override
	public List<ReportVO> read(int houseNo) {
		return reportDao.select(houseNo);
	}
	@Override
	public List<ReportVO> read() {
		return reportDao.select();
	}
	@Override
	public List<ReportVO> read(HashMap<String, Object> map) {
		return reportDao.select(map);
	}
	@Override
	public int getCountByHouseNo(int houseNo) {
		return reportDao.getCountByHouseNo(houseNo);
	}
}
