package edu.spring.homeshare.service;

import edu.spring.homeshare.domain.memberVO;

public interface MemberService {
	memberVO loginCheck(memberVO vo);
	String findId(memberVO vo);

}
