package com.vpfinance.model;

/**
* <p>Title: BAdmin</p>
* <p>Description: bAdmin vo </p>
* @author HuangShaoQing
* @version 0.1
*/

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="b_admin")
public class BAdmin implements Serializable {
        /**
        * ID
        */
        @Id
        @Column(name="id")
        private Long id;
        /**
        * 
        */
        @Column(name="adminName")
        private String adminName;
        /**
        * 
        */
        @Column(name="pwd")
        private String pwd;
        /**
        * 
        */
        @Column(name="createTime")
        private String createTime;
        /**
        * 
        */
        @Column(name="isEnable")
        private int isEnable;

        /**
        * ID getter,setter method
        */
        public Long getId( ){
        return id;
        }

        public void setId( Long id ){
        this.id = id;
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
        *  getter,setter method
        */
        public String getCreateTime( ){
        return createTime;
        }

        public void setCreateTime( String createTime ){
        this.createTime = createTime;
        }
        /**
        *  getter,setter method
        */
        public int getIsEnable( ){
        return isEnable;
        }

        public void setIsEnable( int isEnable ){
        this.isEnable = isEnable;
        }
}

