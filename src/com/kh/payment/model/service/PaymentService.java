package com.kh.payment.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.mysub.model.service.MySubService;
import com.kh.payment.model.dao.PaymentDao;
import com.kh.payment.model.vo.Payment;
import com.kh.product.model.dao.SubscriptionDao;
import com.kh.product.model.vo.Subscription;

public class PaymentService {
	
	
	/**
	 * 1-1. 관리자 구독권 결제 리스트 조회
	 * @return		구독권 결제 리스트 조회
	 */
	public ArrayList<Payment> adminSelectListSPay(){
		
		Connection conn = getConnection();
		
		ArrayList<Payment> list = new PaymentDao().adminSelectListSPay(conn);
		
		close(conn);
		
		return list;

	}
	
	
	/**
	 * 1-2. 관리자 도서 결제 리스트 조회
	 * @return		구독권 결제 리스트 조회
	 */
	public ArrayList<Payment> adminSelectListBPay(){
		
		Connection conn = getConnection();
		
		ArrayList<Payment> list = new PaymentDao().adminSelectListBPay(conn);
		
		close(conn);
		
		return list;

	}
	
	/**
	 * 2. 구독권 결제하기 서비스
	 * @param uNo		구매자의 고유 멤버번호
	 * @param sNo		구매하려는 구독권의 번호
	 * @return			처리된 행의 개수
	 */
	public int insertSbPayment(int uNo, int sNo, String type) {
		
		Connection conn = getConnection();
		Member m = new MemberDao().adminSelectDetail(conn, uNo);
		Subscription s = new SubscriptionDao().selectDetailView(conn, sNo);
		
		int result = new PaymentDao().insertSbPayment(conn, m, s, type);
		
		
		if(result >0) {
			commit(conn);
			
			// 보유 구독권 추가하는 서비스
			new MySubService().insertMySubService(uNo, s);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	
	/**
	 * 3. 구독권 결제수 (한달 내)
	 * @return		조회된 결제수
	 */
	public Payment countSBPayment() {
		
		Connection conn = getConnection();
		
		Payment result = new PaymentDao().countSBPayment(conn);
		
		close(conn);
		
		return result;

	}
	
	
	/**
	 * 4. 가장 많이 구매된 구독권
	 * @return		조회된 결제 내용
	 */
	public Payment manySBPayment() {
		
		Connection conn = getConnection();
		
		Payment result = new PaymentDao().manySBPayment(conn);
		
		close(conn);
		
		return result;
		
	}
	
	
	/**
	 * 5. 최근 구독권 구매한 회원 정보
	 * @return		조회된 리스트
	 */
	public ArrayList<Payment> recentSBPayment(){
		
		Connection conn = getConnection();
		
		ArrayList<Payment> list = new PaymentDao().recentSBPayment(conn);
		
		close(conn);
		
		return list;

	}
	
	
	/**
	 * 6. 도서 결제수 (한달 내)
	 * @return		조회된 결제수
	 */
	public Payment countBPayment() {
		
		Connection conn = getConnection();
		
		Payment result = new PaymentDao().countBPayment(conn);
		
		close(conn);
		
		return result;
		
		
	}
	
	
	/**
	 * 7. 가장 많이 구매된 도서정보
	 * @return		조회된 결제 내용
	 */
	
	public Payment manyBPayment() {
		
		Connection conn = getConnection();
		
		Payment result = new PaymentDao().manyBPayment(conn);
		
		close(conn);
		
		return result;
		
	}
	
	/**
	 * 8. 최근 소장하기 구매한 회원 정보
	 * @return		조회된 리스트
	 */
	public ArrayList<Payment> recentBPayment(){
		
		Connection conn = getConnection();
		
		ArrayList<Payment> list = new PaymentDao().recentBPayment(conn);
		
		close(conn);
		
		return list;

	}


}
