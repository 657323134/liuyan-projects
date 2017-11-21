package @packageDir;

 /**
 * <p>Title: @objectNameUSearch</p>
 * <p>Description: @objectNameLSearch vo</p>
 * @author @authorName
 * @version 0.1
 */

import java.io.Serializable;

@SuppressWarnings("serial")
public class @objectNameUSearch implements Serializable {
  <L>
  <LS>
  
  /**
   * @fieldDesc
   */
  private String @fieldNameL;
  </LS>   
  <LR>
  
  /**
   * @fieldDesc Begin~End
   */
  private String @fieldNameLBegin;
  private String @fieldNameLEnd;
  </LR>  
  </L>
  <L>
  <LS>
  
  /**
   * @fieldDesc getter,setter method
   */
  public String get@fieldNameU( ){
    return @fieldNameL;
  }

  public void set@fieldNameU( String @fieldNameL ){
    this.@fieldNameL = @fieldNameL;
  }
  </LS>  
  <LR>
  
  /**
   * @fieldDescBegin getter,setter method
   */
  public String get@fieldNameUBegin( ){
    return @fieldNameLBegin;
  }
  
  public void set@fieldNameUBegin( String @fieldNameLBegin ){
    this.@fieldNameLBegin = @fieldNameLBegin;
  }

  /**
   * @fieldDescEnd getter,setter method
   */
  public String get@fieldNameUEnd( ){
    return @fieldNameLEnd;
  } 
  
  public void set@fieldNameUEnd( String @fieldNameLEnd ){
    this.@fieldNameLEnd = @fieldNameLEnd;
  }
  </LR>  
  </L>
}