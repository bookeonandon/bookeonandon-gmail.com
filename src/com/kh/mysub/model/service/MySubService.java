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

}
