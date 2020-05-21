package edu.spring.homeshare.persistence;

import java.util.List;

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
	@Override
	public List<BookVO> selectHouseNo(int houseNo) {
		return sqlSession.selectList(NAMESPACE + ".select_by_houseNo", houseNo);
	}
	@Override
	public List<BookVO> selectMemNo(int memNo) {
		return sqlSession.selectList(NAMESPACE + ".select_by_MemNo", memNo);
	}

}
