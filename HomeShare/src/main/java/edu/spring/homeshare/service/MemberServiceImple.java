package edu.spring.homeshare.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.homeshare.domain.memberVO;
import edu.spring.homeshare.persistence.MemberDAO;

@Service
public class MemberServiceImple implements MemberDAO, MemberService {
	
	@Autowired
	private MemberDAO memberDao;
	@Override
	public memberVO loginCheck(memberVO vo) {
		return memberDao.loginCheck(vo);
	}

}
