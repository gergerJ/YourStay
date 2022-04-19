package yourstay.md.service;

import java.util.List;

import yourstay.md.domain.Reservation;
import yourstay.md.domain.ReservationDateVO;

public interface ReservationService {
	/*
	 * �������̺� ���
	 */
	public void insertReservationS(Reservation reservationVO);
	/*
	 * ���೯¥���̺� ���
	 */
	public void insertReservationDateS(ReservationDateVO rdateVO);
	/*
	 * ���೯¥���̺� ��ȸ
	 */
	public List<ReservationDateVO> selectReservationDateS(Reservation reservationVO);
	
	public void ReservationDateS(Reservation reservationVO);
	public Long checkView(long mseq);
	public Long checkView2(long mseq);
	/*
    * Raccept 하기 위한 Reservation 찾기 
   */
//   public Reservation findReservationRacceptS(long rid);
   /*
    * 해당 예약건 수락해주는 기능 ( Reservation UpdateRaccept )  
   */
   public int racceptUpdateS(Reservation reservation);
}