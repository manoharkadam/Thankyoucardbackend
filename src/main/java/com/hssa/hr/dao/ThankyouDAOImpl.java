/**
 * 
 */
package com.hssa.hr.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hssa.hr.base.dao.BaseDao;
import com.hssa.hr.model.ThankYouTO;

/**
 * @author USER
 *
 */
@Repository
public class ThankyouDAOImpl extends BaseDao implements ThankyouDAO {

	@Override
	@Transactional
	public void savegreetings(ThankYouTO data) {
		// TODO Auto-generated method stub
		try {
			save(data);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
