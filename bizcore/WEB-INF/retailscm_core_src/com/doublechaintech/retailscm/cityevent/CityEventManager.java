
package com.doublechaintech.retailscm.cityevent;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;
import com.terapico.caf.DateTime;
import com.doublechaintech.retailscm.RetailscmUserContext;
import com.doublechaintech.retailscm.BaseEntity;
import com.doublechaintech.retailscm.SmartList;

public interface CityEventManager{

		

	public CityEvent createCityEvent(RetailscmUserContext userContext, String name, String mobile, String cityServiceCenterId, String description) throws Exception;	
	public CityEvent updateCityEvent(RetailscmUserContext userContext,String cityEventId, int cityEventVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception;
	public CityEvent loadCityEvent(RetailscmUserContext userContext, String cityEventId, String [] tokensExpr) throws Exception;
	public CityEvent internalSaveCityEvent(RetailscmUserContext userContext, CityEvent cityEvent) throws Exception;
	public CityEvent internalSaveCityEvent(RetailscmUserContext userContext, CityEvent cityEvent,Map<String,Object>option) throws Exception;
	
	public CityEvent transferToAnotherCityServiceCenter(RetailscmUserContext userContext, String cityEventId, String anotherCityServiceCenterId)  throws Exception;
 

	public void delete(RetailscmUserContext userContext, String cityEventId, int version) throws Exception;
	public int deleteAll(RetailscmUserContext userContext, String secureCode ) throws Exception;
	public void onNewInstanceCreated(RetailscmUserContext userContext, CityEvent newCreated)throws Exception;

	/*======================================================DATA MAINTENANCE===========================================================*/
	

	//public  EventAttendanceManager getEventAttendanceManager(RetailscmUserContext userContext, String cityEventId, String name, String potentialCustomerId, String description ,String [] tokensExpr)  throws Exception;
	
	public  CityEvent addEventAttendance(RetailscmUserContext userContext, String cityEventId, String name, String potentialCustomerId, String description , String [] tokensExpr)  throws Exception;
	public  CityEvent removeEventAttendance(RetailscmUserContext userContext, String cityEventId, String eventAttendanceId, int eventAttendanceVersion,String [] tokensExpr)  throws Exception;
	public  CityEvent updateEventAttendance(RetailscmUserContext userContext, String cityEventId, String eventAttendanceId, int eventAttendanceVersion, String property, String newValueExpr,String [] tokensExpr)  throws Exception;

	/*

	*/



}


