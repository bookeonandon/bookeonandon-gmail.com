package com.kh.product.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.product.model.dao.SubscriptionDao;
import com.kh.product.model.vo.Subscription;

public class SubscriptionService {
	
	
	/**
	 * 1. 관리자 구독권 리스트 조회
	 * @return			전체 구독권 리스트
	 */
	public ArrayList<Subscription> adminSelectListSubscription(){
		
		Connection conn = getConnection();
		
		ArrayList<Subscription> list = new SubscriptionDao().adminSelectListSubscription(conn);
		
		close(conn);
		
		return list;
		
		
	}
	
	
	/**
	 * 2. 관리자 구독권 추가
	 * @param s			새로 작성된 구독권 정보
	 * @return			처리된 행의 개수
	 */
	public int insertSubscription(Subscription s) {
		
		Connection conn = getConnection();
		int result = new SubscriptionDao().insertSubscription(conn, s);

		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}
	
	
	/**
	 * 3. 관리자 구독권 삭제
	 * @param nno		삭제할 구독권 번호 배열
	 * @return			처리된 행의 개수
	 */
	public int deleteListSubscription(String[] nno) {
		
		Connection conn = getConnection();
		
		int result = new SubscriptionDao().deleteListSubscription(conn, nno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	/**
	 * 4. 결제하기 구독권 조회 (구독권 상세 조회)
	 * @param sNo		결제할 구독권 번호
	 * @return			전달된 구독권 정보
	 */
	public Subscription selectDetailView(int sNo) {
		
		Connection conn = getConnection();
		
		Subscription s = new SubscriptionDao().selectDetailView(conn, sNo);
		
		close(conn);
		
		return s;
		
		
	}

}
