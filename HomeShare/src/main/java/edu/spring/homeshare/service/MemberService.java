package edu.spring.homeshare.service;

import java.util.HashMap;
import java.util.List;

import edu.spring.homeshare.domain.HouseVO;
import edu.spring.homeshare.domain.MemberVO;

public interface MemberService {
	MemberVO loginCheck(MemberVO vo);
	String findId(MemberVO vo);
	int insert(MemberVO vo);
	MemberVO select(String memId);
	List<MemberVO> readAllMemberOrderby(HashMap<String, Object> map);
	int totalCount();
	
	int update(MemberVO vo);

}
