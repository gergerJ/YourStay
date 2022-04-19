package yourstay.md.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import yourstay.md.domain.Image;
import yourstay.md.domain.Reservation;
import yourstay.md.domain.resultVO;
import yourstay.md.mapper.SearchMapper;
import yourstay.md.service.AccommodationService;
import yourstay.md.service.ReservationService;

@Controller
@RequestMapping("/res")
@Log4j
public class ReservationRestController {
	@Autowired
	SearchMapper searchMapper;
	@Autowired
	AccommodationService accommodationService;
	@Autowired
	ReservationService reservservice;

	@PostMapping("/reservation.do")
	public String checkReservation(Reservation reservationVO) {
		log.info("ReservationController // checkReservation reservationVO :" + reservationVO);
		reservservice.ReservationDateS(reservationVO);
		return "redirect:/";
	}
	/*
	 * ���һ󼼳��� ������ �̵�
	 */
	
	@PostMapping("/reservdetail")
	public ModelAndView reserdetailPage(@RequestParam Integer aid, @RequestParam String rstart, @RequestParam String rend, @RequestParam long resultprice, @RequestParam long days) {
		log.info("reserdetailPage : " + aid);
		log.info("ReservationCon reserdetailPage //// Integer aid : "  + aid+ ", startDate : "+ rstart+", endDate : "+ rend);
		List<Image> roomImage = accommodationService.selectRoomImageS(aid); //�����̹���
		String ipath1 = roomImage.get(0).getStored_file_name(); 
		List<resultVO> rlist = searchMapper.getAccommodationByAccommodationId(aid);
		resultVO rVO = rlist.get(0);
		rVO.setIpath1(ipath1);
		rVO.setRstart(rstart);//����ڼ��� ���۳�¥ ����
		rVO.setRend(rend);//����ڼ��� ����¥ ����
		rVO.setDays(days);//�����ϼ� ����
		rVO.setResultprice(resultprice); //���� �ݾ� ����
		rVO.setAid(aid);
		
		
		log.info("reserdetailPage resultVO: " + rVO.toString());
		return new ModelAndView("/reserdetail/reservation","rdetail",rVO);
	}
   
    /*
     * 업데이트 할  예약페이지 찾기! 
    */
//    @GetMapping("/findReservation")
//    public ModelAndView findReservationRaccept(ModelAndView mv, long rid) {
//       log.info("@@ ReservationControler findReservationRaccept");
//       mv = new ModelAndView("/res/test", "FindReservation", reservservice.findReservationRacceptS(rid));
//       return mv;
//    }
    /*
     * 업데이트 할  예약페이지 찾기! 
    */
    @PostMapping("/updateRaccept")
    public ModelAndView updateRaccept(ModelAndView mv, Reservation reservation) {
       reservservice.racceptUpdateS(reservation);
       mv.addObject("rid", reservation.getRid());
       log.info("##ReservationRestController updateRaccept 완료!!!! ");
       mv.setViewName("redirect: /mypage/accessPage");
       return mv;
    }
}