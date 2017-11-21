package com.vpfinance;

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
   * 帐户名
   */
  private String adminName;
  
  /**
   * 密码
   */
  private String pwd;
  
  /**
   * 是否禁用 Begin~End
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
   * 帐户名 getter,setter method
   */
  public String getAdminName( ){
    return adminName;
  }

  public void setAdminName( String adminName ){
    this.adminName = adminName;
  }
  
  /**
   * 密码 getter,setter method
   */
  public String getPwd( ){
    return pwd;
  }

  public void setPwd( String pwd ){
    this.pwd = pwd;
  }
  
  /**
   * 是否禁用Begin getter,setter method
   */
  public String getIsEnableBegin( ){
    return isEnableBegin;
  }
  
  public void setIsEnableBegin( String isEnableBegin ){
    this.isEnableBegin = isEnableBegin;
  }

  /**
   * 是否禁用End getter,setter method
   */
  public String getIsEnableEnd( ){
    return isEnableEnd;
  } 
  
  public void setIsEnableEnd( String isEnableEnd ){
    this.isEnableEnd = isEnableEnd;
  }
}

