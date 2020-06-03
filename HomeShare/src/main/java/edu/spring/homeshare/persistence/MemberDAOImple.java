package edu.spring.homeshare.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import edu.spring.homeshare.domain.MemberVO;

@Repository
public class MemberDAOImple implements MemberDAO {
	private static final String NAMESPACE = "edu.spring.homeshare.MemberMapper";
	
	private static final Logger logger =
			LoggerFactory.getLogger(MemberDAOImple.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		logger.info(vo.getMemId() + " " + vo.getPassword());
		return sqlSession.selectOne(NAMESPACE + ".login",vo);
	}
	@Override
	public String findId(MemberVO vo) {
		logger.info("find id 角青");
		return sqlSession.selectOne(NAMESPACE + ".findId",vo);
	}
	@Override
	public int insert(MemberVO vo) {
		logger.info("insert 角青");
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	@Override
	public MemberVO select(String memId) {
		logger.info("select 角青");
		return sqlSession.selectOne(NAMESPACE +".select", memId);
	}
	
	@Override
	public List<MemberVO> selectall(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".select_all_member_orderby",map);
	}
	@Override
	public int gettotalcount() {
		logger.info("gettotalcount 角青");
		return sqlSession.selectOne(NAMESPACE + ".total_count");
	}
}
