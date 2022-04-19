package yourstay.md.mapper;

import java.util.List;

import yourstay.md.domain.Reservation;
import yourstay.md.domain.ReservationDateVO;

public interface ReservationMapper {
	/*
	 * �������̺� ���
	 */
	public void insertReservation(Reservation reservationVO);
	/*
	 * ���೯¥���̺� ���
	 */
	public void insertReservationDate(ReservationDateVO rdateVO);
	/*
	 * ���೯¥���̺� ��ȸ
	 */
	public List<ReservationDateVO> selectReservationDate(Reservation reservationVO);
	
	public Long checkView(long mseq);
	public Long checkView2(long mseq);
	
	/*
     * Raccept 하기 위한 Reservation 찾기 
    */
//    public Reservation findRaccept(long rid);
    /*
     * 해당 예약건 수락해주는 기능 ( Reservation UpdateRaccept )  
    */
    public int racceptUpdate(Reservation reservation);
    
}