package edu.spring.homeshare.persistence;

import java.util.List;

import edu.spring.homeshare.domain.MemberVO;

public interface MemberDAO {
	MemberVO loginCheck(MemberVO vo);
	String findId(MemberVO vo);
	int insert(MemberVO vo);
	MemberVO select(String memId);
	List<MemberVO> selectall(String orderby);
	

}



