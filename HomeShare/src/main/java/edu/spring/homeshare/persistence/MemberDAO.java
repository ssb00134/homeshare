package edu.spring.homeshare.persistence;

import edu.spring.homeshare.domain.memberVO;

public interface MemberDAO {
	memberVO loginCheck(memberVO vo);
}


