package edu.spring.homeshare.persistence;

import edu.spring.homeshare.domain.memberVO;

public interface MemberDAO {
	memberVO loginCheck(memberVO vo);
	String findId(memberVO vo);
	int insert(memberVO vo);
	memberVO select(String memId);
	

}



