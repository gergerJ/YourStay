package yourstay.md.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;
import yourstay.md.domain.Accommodation;
import yourstay.md.domain.Accomoption;
import yourstay.md.domain.Image;
import yourstay.md.domain.MemberVO;
import yourstay.md.domain.Reservation;
import yourstay.md.domain.resultVO;
import yourstay.md.domain.reviewVO;
import yourstay.md.mapper.MemberMapper;
import yourstay.md.mapper.ReviewMapper;
import yourstay.md.service.AccommodationService;
import yourstay.md.service.MemberService;
import yourstay.md.service.MyPageService;
import yourstay.md.service.RoomHistoryService;

@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private AccommodationService accommodationService;
//	@Autowired
//	private MemberMapper memberMapper;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private RoomHistoryService roomService;
	
	
	@GetMapping(value="/home")
    public ModelAndView gohome(HttpSession session){
        log.info("MypageController -> gohome 요청");
        MemberVO vo = memberService.getUser((String)session.getAttribute("memail"));
        ModelAndView mv = new ModelAndView("mypage/home","member",vo);
        return mv;
    }
	@PostMapping(value="/register.do")
	   public ModelAndView roomRegister(ModelAndView mv, HttpServletRequest request){
	      log.info("roomOption Data -> info 전달");
	      MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	      log.info("##### request" + request);
	      log.info("##### multipartRequest" + multipartRequest);
		  //MultipartFile file = multipartRequest.getFile("ipath1");
		  //log.info("file.getSize() : " + file.getSize());
	      
	      //todo : 파일이 없으면 if로직 추가 
		  List<MultipartFile> files = new ArrayList<MultipartFile>();
		  for(int i = 0; i<3;i++) {
			  MultipartFile file = multipartRequest.getFile("ipath"+(i+1));
			  files.add(file);
		  }
		  MultipartFile file1 = files.get(0);
		  
		  MultipartFile file = multipartRequest.getFile("ipath3");
		  log.info("file.getSize() : " + file.getSize());
//	      log.info("로그인한 회원의 번호: " + mseq);
//	      log.info("result aname: " + registervo.getAname());
//	      log.info("aname: " + aname);
//	      accommodationService.inssertImageS(img);// 이미지 테이블에 insert
//	      accommodationService.insertAccommodationS(ac, mpRequest);// 숙소  테이블에 insert
//	      log.info("옵션번호: "+ aco.getAid() +", 숙소번호 : "+aco.getOid()+", 방개수 : "+aco.getRnum()+", TV유무 : "+ aco.getTv());
	      //여기에  info페이지로 값을 전달 
	      mv.setViewName("/mypage/home");
	      return mv;
	   }
	
	@PostMapping(value="/regi")
	public String test() {
		log.info("test");
		return null;
	}
	
	@GetMapping(value="/wishlist/{mseq}")
    public String wishlist(@PathVariable("mseq") long mseq, Model model){
        log.info("MypageController -> wishlist 요청");
        Map<String, List> wishMap = myPageService.getWishS(mseq);
    	
		model.addAttribute("wishMap", wishMap);
		
		return "mypage/wishlist";
    }
	@GetMapping(value="/roomHistory")
    public ModelAndView roomHistory(long mseq){
        log.info("MypageController -> roomHistory 요청");
        List<Reservation> vo = roomService.getRoomList(mseq);
        ModelAndView mv = new ModelAndView("mypage/roomHistory","vo",vo);
        log.info("####vo:"+vo.toString());
       
        
        return mv;
    }
   @GetMapping(value="/review")
    public ModelAndView review(HttpSession session, @RequestParam long aid, @RequestParam long mseq) {
        log.info("aid : " + aid+ "// mseq:" + mseq);
        List<reviewVO> vo = reviewMapper.getUser((String) session.getAttribute("memail"));
        log.info("####vo:"+vo);
        reviewVO reviewvo = vo.get(0);
        reviewvo.setAid(aid); //유저가 선택한 숙소번호 입력
        ModelAndView mv = new ModelAndView("mypage/review","member",reviewvo);
        
        return mv;
    }
   
   @GetMapping(value="/roomReservation")
   public ModelAndView roomReservation(long mseq){
       log.info("MypageController -> roomReservation 요청");
       List<Reservation> vo = roomService.getRoomList(mseq);
       ModelAndView mv = new ModelAndView("mypage/roomReservation","vo",vo);
       log.info("####vo:"+vo.toString());
       
       return mv;
   }
   
   
   @GetMapping(value="/roomRegister")
   public ModelAndView roomRegister(@RequestParam long mseq) {
	   resultVO vo = reviewMapper.select(mseq);
	   log.info("MypageController -> roomRegister: "+ vo);
	   ModelAndView mv = new ModelAndView("room/roomRegister","vo",vo);
       return mv;
   }
   
   @GetMapping("updateUser")
	public ModelAndView findMember(ModelAndView mv, String memail) {
		log.info("updateUser -> updateUser 페이지 이동 ");
		log.info("memail: "+ memail);
		MemberVO findMember = memberService.getUser(memail);
		log.info("mcallnum : " + findMember.getMcallnum());
		mv.addObject("findMember", findMember);
		mv.setViewName("/mypage/updatePage");
		return mv;
	}
	@PostMapping("updateUser.do")
	public ModelAndView updateMember(ModelAndView mv, long mseq, String mname, String memail, String mpwd, int mcallnum) {
        MemberVO member = new MemberVO(mseq, mname, memail, mpwd, mcallnum, 0);

		log.info("mseq getMseq 값 : " + member.getMseq()); // 여기까지 됨! 
		log.info("mseq getMname 값 : " + member.getMname());
		log.info("mseq getMemail 값 : " + member.getMemail());
		log.info("mseq getMpwd 값 : " + member.getMpwd());
		log.info("mseq getMcallnum 값 : " + member.getMcallnum());
		
		log.info("####memberVO : " + member);
	
		int updateResult = memberService.updateUser(member);
		log.info("11111111111111");
		if(updateResult>0) {
			log.info("Member Update 성공");
		}else {
			log.info("Member Update 실패");
		}
		mv.setViewName("redirect:/mypage/home");
		return mv;
	}
	@GetMapping("removeUser")
	public ModelAndView findRemoveUser(ModelAndView mv, String memail) {
		MemberVO findMember = memberService.getUser(memail);
		mv.addObject("findMember", findMember);
		mv.setViewName("/mypage/removePage");
		return mv;
	}
	
	@PostMapping("removeUser.do")
	public ModelAndView removeUser(ModelAndView mv, String memail, HttpSession session) {
		int result = memberService.removeUser(memail);
		if(result>0) {
			log.info("## Controller removeUser 성공!!");
			session.invalidate();
		}else {
			log.info("## Controller removeUser 실패!!");
		}
		mv.setViewName("redirect: /");
		return mv;
	}
	
	@PostMapping(value="/wishlist/addwish")
	public ModelAndView addWish(HttpSession session, @RequestParam long aid, @RequestParam long mseq) {
       log.info("aid : " + aid+ "// mseq:" + mseq);
       session.setAttribute("aid", aid);
       List<reviewVO> vo = reviewMapper.getUser((String) session.getAttribute("memail"));
       log.info("mseq"+ mseq);
       log.info("####vo:"+vo);
       
       reviewVO reviewvo = vo.get(0);
       reviewvo.setAid(aid);
       ModelAndView mv = new ModelAndView("mypage/wishlist","wish",reviewvo);
       return mv;
    }
}
