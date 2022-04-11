package yourstay.md.mapper;

import java.util.List;

import yourstay.md.domain.MemberVO;

public interface MemberMapper {
	// CRUDs
	public MemberVO getUser(String memail);
	public List<MemberVO> getUserList();
	public int addUser(MemberVO user);
	public int updateUser(MemberVO member);
	public int removeUser(String memail);
	
	// Functional Methods
	public boolean login(String memail, String mpwd);
}
