package edu.spring.homeshare.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.homeshare.domain.ReportVO;

@Repository
public class ReportDAOImple implements ReportDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "edu.spring.homeshare.ReportMapper";
	
	@Override
	public int insert(ReportVO vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	@Override
	public List<ReportVO> select(int houseNo) {
		return sqlSession.selectList(NAMESPACE + ".select_all_by_houseno", houseNo);
	}
	@Override
	public List<ReportVO> select() {
		return sqlSession.selectList(NAMESPACE + ".select_all");
	}
	
	//����¡
	@Override
	public List<ReportVO> select(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE +".reportPaging", map);
	}
	
	@Override
	public int getCountByHouseNo(int houseNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE +".select_count_by_houseNo", houseNo);

	}
}
