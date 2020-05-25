package edu.spring.homeshare.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.homeshare.domain.ReplyVO;


@Repository
public class ReplyDAOImple implements ReplyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "edu.spring.homeshare.ReplyMapper";
	
	@Override
	public int insert(ReplyVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	@Override
	public List<ReplyVO> select(int houseNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".select_all_by_houseno", houseNo);
	}
	
	@Override
	public int selectCount() {
		return sqlSession.selectOne(NAMESPACE+".select_count");
	}
	@Override
	public int update(ReplyVO vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}
	@Override
	public int delete(int rno) {
		return sqlSession.delete(NAMESPACE + ".delete", rno);
	}
	@Override
	public int selectAvgScore(int houseNo) {
		return sqlSession.selectOne(NAMESPACE + ".select_avg_score", houseNo);
	}
}





