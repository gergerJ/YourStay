package yourstay.md.service;

import java.util.List;

import yourstay.md.domain.MemberVO;

public interface MemberService {
	//CRUD 기능 
	List<MemberVO> getUserList(MemberVO member);
	MemberVO getUser(String memail);
	int addUser(MemberVO user);
	int updateUser(MemberVO member);
	int removeUser(String memail);
}
