package com.kh.mysub.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.mysub.model.dao.MySubDao;
import com.kh.product.model.vo.Subscription;

public class MySubService {
	
	
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
