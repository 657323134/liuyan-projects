package com.vpfinance.model;

 /**
 * <p>Title: BAdminSearch</p>
 * <p>Description: bAdminSearch vo</p>
 * @author HuangShaoQing
 * @version 0.1
 */

import java.io.Serializable;

@SuppressWarnings("serial")
public class BAdminSearch implements Serializable {
  
  /**
   * ID Begin~End
   */
  private String idBegin;
  private String idEnd;
  
  /**
   * 
   */
  private String adminName;
  
  /**
   * 
   */
  private String pwd;
  
  /**
   *  Begin~End
   */
  private String createTimeBegin;
  private String createTimeEnd;
  
  /**
   *  Begin~End
   */
  private String isEnableBegin;
  private String isEnableEnd;
  
  /**
   * IDBegin getter,setter method
   */
  public String getIdBegin( ){
    return idBegin;
  }
  
  public void setIdBegin( String idBegin ){
    this.idBegin = idBegin;
  }

  /**
   * IDEnd getter,setter method
   */
  public String getIdEnd( ){
    return idEnd;
  } 
  
  public void setIdEnd( String idEnd ){
    this.idEnd = idEnd;
  }
  
  /**
   *  getter,setter method
   */
  public String getAdminName( ){
    return adminName;
  }

  public void setAdminName( String adminName ){
    this.adminName = adminName;
  }
  
  /**
   *  getter,setter method
   */
  public String getPwd( ){
    return pwd;
  }

  public void setPwd( String pwd ){
    this.pwd = pwd;
  }
  
  /**
   * Begin getter,setter method
   */
  public String getCreateTimeBegin( ){
    return createTimeBegin;
  }
  
  public void setCreateTimeBegin( String createTimeBegin ){
    this.createTimeBegin = createTimeBegin;
  }

  /**
   * End getter,setter method
   */
  public String getCreateTimeEnd( ){
    return createTimeEnd;
  } 
  
  public void setCreateTimeEnd( String createTimeEnd ){
    this.createTimeEnd = createTimeEnd;
  }
  
  /**
   * Begin getter,setter method
   */
  public String getIsEnableBegin( ){
    return isEnableBegin;
  }
  
  public void setIsEnableBegin( String isEnableBegin ){
    this.isEnableBegin = isEnableBegin;
  }

  /**
   * End getter,setter method
   */
  public String getIsEnableEnd( ){
    return isEnableEnd;
  } 
  
  public void setIsEnableEnd( String isEnableEnd ){
    this.isEnableEnd = isEnableEnd;
  }
}

