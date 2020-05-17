package edu.spring.homeshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
