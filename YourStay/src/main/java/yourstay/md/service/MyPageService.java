package yourstay.md.service;

import java.util.List;
import java.util.Map;

import yourstay.md.domain.Accommodation;
import yourstay.md.domain.MemberVO;
import yourstay.md.domain.WishListVO;
import yourstay.md.domain.reviewVO;

public interface MyPageService {
	/*
	 * 회원의 찜정보뽑기
	 */
	public List<WishListVO> getWishAidS(long mseq);
	/*
	 * 회원이 찜한 숙박업체 리스트
	 */
	public List<Accommodation> getWishListS(List<WishListVO> wishlist);
	/*
	 * 회원이 찜한 숙박업체 등록 기능
	 */
	public int addWishListS(reviewVO reviewvo);
	
	
	Map<String, List> getWishS(long mseq);
	
}
