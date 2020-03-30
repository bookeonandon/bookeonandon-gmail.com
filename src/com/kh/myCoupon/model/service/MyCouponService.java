package com.kh.myCoupon.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.book.model.dao.BookDao;
import com.kh.book.model.vo.Book;
import com.kh.coupon.model.vo.Coupon;
import com.kh.myCoupon.model.dao.MyCouponDao;
import com.kh.myCoupon.model.vo.MyCoupon;

public class MyCouponService {
	
	
	
	/**
	 * 1. 관리자 쿠폰 발급
	 * @param uNo		쿠폰 받을 회원 정보 배열
	 * @param c			발급할 쿠폰 정보
	 * @return			처리된 행의 개수
	 */
	public int insertMyCoupon(String[] uNo, Coupon c) {
		
		Connection conn = getConnection();
				
		int result = new MyCouponDao().insertMyCoupon(conn, uNo, c);
		

		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 2. 도서 구매 시 회원이 보유한 쿠폰
	 * @param uNo		회원번호
	 * @param bNo		선택한 도서 번호
	 * @return			보유한 쿠폰 리스트
	 */
	public ArrayList<MyCoupon> payDetailCoupon(int uNo, int bNo) {
		
		Connection conn = getConnection();
		
		Book b = new BookDao().adminUpdateFormBook(conn, bNo);
		
		ArrayList<MyCoupon> list = new MyCouponDao().payDetailCoupon(conn, uNo, b);
		
		close(conn);
			
		return list;
		
		
	}
	
	
	/**
	 * 3. 관리자 회원 상세 보유 쿠폰 보기
	 * @param nId		회원번호
	 * @return			조회환 쿠폰 리스트
	 */
	public ArrayList<MyCoupon> adminSelectMyCoupon(String nId){
		
		Connection conn = getConnection();
		
		ArrayList<MyCoupon> list = new MyCouponDao().adminSelectMyCoupon(conn, nId);
		
		close(conn);
		
		return list;
		
	}

}
