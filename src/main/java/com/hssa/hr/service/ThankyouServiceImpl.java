/**
 * 
 */
package com.hssa.hr.service;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hssa.hr.dao.ThankyouDAO;
import com.hssa.hr.model.ThankYouTO;

/**
 * @author USER
 *
 */
@Service
public class ThankyouServiceImpl implements ThankyouService {
@Autowired
ThankyouDAO leaddao;
	
	@Override
	public void savegreetings(ThankYouTO data) {
		// TODO Auto-generated method stub
		try {
			leaddao.savegreetings(data);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
