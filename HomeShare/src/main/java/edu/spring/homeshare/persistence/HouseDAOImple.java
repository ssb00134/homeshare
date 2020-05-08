package edu.spring.homeshare.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.util.PageCriteria;

@Repository
public class HouseDAOImple implements HouseDAO {

	private static final String NAMESPACE = "edu.spring.homeshare.HouseMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	Logger logger = LoggerFactory.getLogger(HouseDAOImple.class);
	
	

	@Override
	public HouseVO selectByTitle(String title) {
		logger.info("selectByTest 실행");
		return sqlSession.selectOne(NAMESPACE + ".select_by_title", title);
	}
	@Override
	public List<HouseVO> selectAll() {
		logger.info("selectAll 실행");
		return sqlSession.selectList(NAMESPACE + ".select_all");
	}
	@Override
	public int insert(HouseVO vo) {
		logger.info("insert 실행");
		return sqlSession.insert(NAMESPACE+".insert", vo);
	}
	
	@Override
	public HouseVO selectByHouseNo(int houseNo) {
		logger.info("selectByHouseNo 실행");
		return sqlSession.selectOne(NAMESPACE + ".select_by_houseno", houseNo);
	}
	
	@Override
	public int getTotalHouseNums() {
		logger.info("getTotalHouseNums 실행");
		return  sqlSession.selectOne(NAMESPACE + ".get_total_house_nums");
	}
	
	@Override
	public List<HouseVO> select(PageCriteria criteria) {
		logger.info("select(PageCriteria c) 실행");
		logger.info("시작번호 : " +criteria.getStart());
		logger.info("끝번호 : " +criteria.getEnd());
		return sqlSession.selectList(NAMESPACE + ".paging", criteria);
	}
	
	@Override
	public List<HouseVO> selectAllByMemNo(int memNo) {
		logger.info("selectAllByMemNo 실행");
		return sqlSession.selectList(NAMESPACE+".select_all_by_memno",memNo);
	}

}
