package edu.spring.homeshare.persistence;

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
	public HouseVO select(String houseNo) {
		return sqlSession.selectOne(NAMESPACE + ".select()");
	}

}
