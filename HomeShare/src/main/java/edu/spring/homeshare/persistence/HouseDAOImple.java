package edu.spring.homeshare.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.homeshare.domain.HouseVO;

@Repository
public class HouseDAOImple implements HouseDAO {

	private static final String NAMESPACE = "edu.spring.homeshare.HouseMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	Logger logger = LoggerFactory.getLogger(HouseDAOImple.class);
	
	

	@Override
	public HouseVO selectByTitle(String title) {
		logger.info("selectByTest 角青");
		return sqlSession.selectOne(NAMESPACE + ".select_by_title", title);
	}
	@Override
	public List<HouseVO> selectAll() {
		logger.info("selectAll 角青");
		return sqlSession.selectList(NAMESPACE + ".select_all");
	}
	@Override
	public int insert(HouseVO vo) {
		logger.info("insert 角青");
		return sqlSession.insert(NAMESPACE+".insert", vo);
	}
	
	@Override
	public HouseVO selectByHouseNo(int houseNo) {
		logger.info("selectByHouseNo 角青");
		return sqlSession.selectOne(NAMESPACE + ".select_by_houseno", houseNo);
	}

}
