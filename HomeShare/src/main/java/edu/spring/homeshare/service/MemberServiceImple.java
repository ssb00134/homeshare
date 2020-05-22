package edu.spring.homeshare.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.homeshare.domain.MemberVO;
import edu.spring.homeshare.persistence.HouseDAOImple;
import edu.spring.homeshare.persistence.MemberDAO;

@Service
public class MemberServiceImple implements MemberDAO, MemberService {
	
	Logger logger = LoggerFactory.getLogger(HouseDAOImple.class);
	
	@Autowired
	private MemberDAO memberDao;
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return memberDao.loginCheck(vo);
	}
	@Override
	public String findId(MemberVO vo) {
		return memberDao.findId(vo);
	}
	@Override
	public int insert(MemberVO vo) {
		return memberDao.insert(vo);
	}
	@Override
	public MemberVO select(String memId) {
		return memberDao.select(memId);
	}
	

}
