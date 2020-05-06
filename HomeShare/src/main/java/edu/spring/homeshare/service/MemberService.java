package edu.spring.homeshare.service;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.memberVO;

public interface MemberService {
	memberVO loginCheck(memberVO vo);
	String findId(memberVO vo);
	int insert(memberVO vo);
	memberVO select(String memId);


}
