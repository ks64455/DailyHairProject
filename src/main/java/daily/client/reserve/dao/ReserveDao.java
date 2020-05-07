package daily.client.reserve.dao;

import java.util.List;

import daily.client.reserve.vo.ReserveVo;

public interface ReserveDao {
	// view에서 controller로 service에 있는 기능 호출 - dao를 통해 DB조작
	// DaoImpl에서 사용될 기능들을 선언
	// DB에 접근하여 데이터를 조작하는 역할
	
	public List<ReserveVo> selectTime(ReserveVo rvo);
	public int insertReservation(ReserveVo rvo);				// 예약하기
	public List<ReserveVo> myreservationList(String m_id);		// 자신의 예약내역불러오기
	public ReserveVo myReservationDetail(int rest_num);			// 자신의 예약내역 상세 보기
	public int confirmReservationCnt(String m_id);				// 예약이 있는지 없는지 확인(비활성화할때 사용)
}
