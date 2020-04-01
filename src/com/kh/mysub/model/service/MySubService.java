package com.kh.mysub.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.mysub.model.dao.MySubDao;
import com.kh.mysub.model.vo.MySub;
import com.kh.product.model.vo.Subscription;

public class MySubService {
	
	
	public MySub adminSelectDetail(int uNo) {
		
		Connection conn = getConnection();
		
		MySub ms = new MySubDao().adminSelectDetail(conn, uNo);
		
		close(conn);
		
		return ms;
	}
	
	/**
	 * 2. 보유구독권 추가하기 (결제페이지)
	 * @param uNo		// 구매회원 번호
	 * @param s			// 구매하려는 구독권 객체
	 * @return			// 처리된 행의 개수
	 */
	public int insertMySubService(int uNo, Subscription s) {
		
		Connection conn = getConnection();
		
		int result = new MySubDao().insertMySub(conn, uNo, s);
		
			
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/**
	 * 3. 관리자 보유구독권 추가 및 연장하기
	 * @param uNo		회원 번호
	 * @param s			추가할 구독권 정보
	 * @param ms		보유 구독권 여부
	 * @return			처리된 행의 개수
	 */
	public int adminInsertMySubService(int uNo, Subscription s, MySub ms) {
		
		Connection conn = getConnection();
		
		int result = 0;
		
		// 보유구독권 있을 때
		if(ms != null) {
			
			result = new MySubDao().adminUpdateMySub(conn, uNo, s);
			
		// 보유구독권 없을 때
		}else {
			
			result = new MySubDao().insertMySub(conn, uNo, s);
			
			if(result >0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		
		
		close(conn);
		
		return result;
		
	}
	
	/**
	 * 4. 관리자 회원 상세 보유구독권 정보
	 * @param nId		회원아이디
	 * @return			보유 구독권 정보
	 */
	public MySub adminSelectMySub(String nId) {
		
		Connection conn = getConnection();
		
		MySub ms = new MySubDao().adminSelectMySub(conn, nId);
		
		close(conn);
		
		return ms;
	}

}
