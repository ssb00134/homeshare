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
		logger.info("selectByTest ����");
		return sqlSession.selectOne(NAMESPACE + ".select_by_title", title);
	}
	@Override
	public List<HouseVO> selectAll() {
		logger.info("selectAll ����");
		return sqlSession.selectList(NAMESPACE + ".select_all");
	}

}
