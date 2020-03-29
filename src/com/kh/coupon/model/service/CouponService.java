package com.kh.coupon.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.coupon.model.dao.CouponDao;
import com.kh.coupon.model.vo.Coupon;

/**
 * @author qwbvc
 *
 */
public class CouponService {
	
	
	/**
	 * 1. 쿠폰 관리자 리스트 조회
	 * @return		조회된 쿠폰 리스트
	 */
	public ArrayList<Coupon> adminSelectListCoupon(){
		Connection conn = getConnection();
		
		ArrayList<Coupon> list = new CouponDao().adminSelectListCoupon(conn);
		
		close(conn);
		
		return list;
		
	}
	
	
	/**
	 * 2. 쿠폰 등록
	 * @param c			등록할 쿠폰 정보
	 * @return			처리된 행의 개수
	 */
	public int insertCoupon(Coupon c) {
		
		Connection conn = getConnection();
		
		int result = new CouponDao().insertCoupon(conn, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
		
	}
	
	
	/**
	 * 3. 쿠폰 삭제
	 * @param chk		삭제할 쿠폰 번호 리스트
	 * @return			처리된 행의 개수
	 */
	public int deleteListCoupon(String[] chk) {
		
		Connection conn = getConnection();
		
		int result = new CouponDao().deleteListCoupon(conn, chk);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Coupon detailCoupon(int cNo) {
		Connection conn = getConnection();
		
		Coupon c = new CouponDao().detailCoupon(conn, cNo);
		
		close(conn);
		
		return c;
	}

}
