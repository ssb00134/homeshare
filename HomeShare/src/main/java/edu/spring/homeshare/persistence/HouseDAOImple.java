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
		return sqlSession.insert(NAMESPACE+".insert", vo);
	}
	
	@Override
	public HouseVO selectByHouseNo(int houseNo) {
		logger.info("selectByHouseNo ����");
		return sqlSession.selectOne(NAMESPACE + ".select_by_houseno", houseNo);
	}
	
	@Override
	public int getTotalHouseNums() {
		logger.info("getTotalHouseNums ����");
		return  sqlSession.selectOne(NAMESPACE + ".get_total_house_nums");
	}
	
	@Override
	public List<HouseVO> select(PageCriteria c) {
		logger.info("select(PageCriteria c) ����");
		logger.info("���۹�ȣ : " +c.getStart());
		logger.info("����ȣ : " +c.getEnd());
		return sqlSession.selectOne(NAMESPACE + ".select_pagescope", c);
	}
	
	@Override
	public List<HouseVO> selectAllByMemNo(int memNo) {
		logger.info("selectAllByMemNo ����");
		return sqlSession.selectList(NAMESPACE+".select_all_by_memno",memNo);
	}

}
