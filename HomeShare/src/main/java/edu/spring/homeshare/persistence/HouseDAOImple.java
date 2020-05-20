package edu.spring.homeshare.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		logger.info("selectByTest ����");
		return sqlSession.selectOne(NAMESPACE + ".select_by_title", title);
	}

	@Override
	public List<HouseVO> selectAll() {
		logger.info("selectAll ����");
		return sqlSession.selectList(NAMESPACE + ".select_all");
	}

	@Override
	public int insert(HouseVO vo) {
		logger.info("insert ����");
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	@Override
	public HouseVO selectByHouseNo(int houseNo) {
		logger.info("selectByHouseNo ����");
		return sqlSession.selectOne(NAMESPACE + ".select_by_houseno", houseNo);
	}

	@Override
	public List<HouseVO> select(PageCriteria criteria) {
		logger.info("select(PageCriteria c) ����");
		logger.info("���۹�ȣ : " + criteria.getStart());
		logger.info("����ȣ : " + criteria.getEnd());
		return sqlSession.selectList(NAMESPACE + ".paging", criteria);
	}

	@Override
	public List<HouseVO> selectAllByMemNo(int memNo) {
		logger.info("selectAllByMemNo ����");
		return sqlSession.selectList(NAMESPACE + ".select_all_by_memno", memNo);
	}

	@Override
	public int getTotalNumsOfRecords() {
		logger.info("getTotalNumsOfRecords ����");
		return sqlSession.selectOne(NAMESPACE + ".total_count");
	}

	@Override
	public int getCountHouseByMemNo(int memNo) {
		logger.info("getCountHouseByMemNo ����");
		return sqlSession.selectOne(NAMESPACE + ".selectcount_house_by_memno_no", memNo);
	}

	@Override
	public List<HouseVO> select(String location) {
		logger.info("select location ����");
		return sqlSession.selectList(NAMESPACE + ".select_by_location", location);
	}

	@Override
	public List<HouseVO> select(HashMap<String, Object> map) {
		logger.info("paging_multy_select ����");
		return sqlSession.selectList(NAMESPACE + ".paging_multy_select", map);
	}

	@Override
	public int getTotalNumsOfRecords(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".total_count_multy_select", map);
	}

	@Override
	public int update(int houseNo) {
		logger.info("update ����");
		return sqlSession.update(NAMESPACE + ".update", houseNo);
	}

	@Override
	public int delte(int houseNo) {
		logger.info("delete ����");
		return sqlSession.update(NAMESPACE + ".delete", houseNo);
	}
	@Override
	public int selectSeqence() {
		logger.info("selectSeqence ����");
		return sqlSession.selectOne(NAMESPACE + ".select_seq");

	}

}
