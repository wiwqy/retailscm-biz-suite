
package com.doublechaintech.retailscm.retailstorecreation;
import com.doublechaintech.retailscm.AccessKey;


public class RetailStoreCreationTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
	static final String TABLE_NAME="retail_store_creation_data";
	static final String COLUMN_ID = "id";
	static final String COLUMN_COMMENT = "comment";
	static final String COLUMN_VERSION = "version";
 
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_COMMENT, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
		COLUMN_COMMENT
		};
	
	
}


