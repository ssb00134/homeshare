package edu.spring.homeshare.persistence;

import java.util.HashMap;
import java.util.List;

import edu.spring.homeshare.domain.MemberVO;

public interface MemberDAO {
	MemberVO loginCheck(MemberVO vo);
	String findId(MemberVO vo);
	int insert(MemberVO vo);
	MemberVO select(String memId);
	List<MemberVO> selectall(HashMap<String, Object> map);
	int gettotalcount();
	
	//update
	int update(MemberVO vo);
	
	//���̵� �ߺ�üũ
	int idChk(MemberVO vo);

}



