package edu.spring.homeshare.service;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.MemberVO;

public interface MemberService {
	MemberVO loginCheck(MemberVO vo);
	String findId(MemberVO vo);
	int insert(MemberVO vo);
	MemberVO select(String memId);


}
