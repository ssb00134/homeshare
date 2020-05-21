package edu.spring.homeshare.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.homeshare.domain.BookVO;
import edu.spring.homeshare.domain.HouseVO;

@Repository
public class BookDAOImple implements BookDAO {
	private static final String NAMESPACE = "edu.spring.homeshare.BookMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insert(BookVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	

}
