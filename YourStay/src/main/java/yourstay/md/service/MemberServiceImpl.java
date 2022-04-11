package yourstay.md.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jdk.internal.jline.internal.Log;
import lombok.extern.log4j.Log4j;
import yourstay.md.domain.MemberVO;
import yourstay.md.mapper.MemberMapper;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public List<MemberVO> getUserList(MemberVO member) {
		return memberMapper.getUserList();
	}

	@Override
	public MemberVO getUser(String memail) {
		return memberMapper.getUser(memail);
	}
	
	@Override
	public int addUser(MemberVO user) {
		memberMapper.addUser(user);
		return 0;
	}

	@Override
	public int updateUser(MemberVO member) {
		int result = memberMapper.updateUser(member); 
		if(result>0) {
			log.info("## Service UpdateUser 성공!!");
		}else {
			log.info("## Service UpdateUser 실패!!");
		}
		return result;
	}

	@Override
	public int removeUser(String memail) {
		int result = memberMapper.removeUser(memail);
		if(result>0) {
			log.info("## Service removeUser 성공!!");
		}else {
			log.info("## Service removeUser 실패!!");
		}
		return result;
	}
}
