package com.vpfinance;

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
        @Column(name="id")
        private bigint id;
        /**
        * 帐户名
        */
        @Column(name="adminName")
        private String adminName;
        /**
        * 密码
        */
        @Column(name="pwd")
        private String pwd;
        /**
        * 是否禁用
        */
        @Column(name="isEnable")
        private int isEnable;

        /**
        * ID getter,setter method
        */
        public bigint getId( ){
        return id;
        }

        public void setId( bigint id ){
        this.id = id;
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
        * 是否禁用 getter,setter method
        */
        public int getIsEnable( ){
        return isEnable;
        }

        public void setIsEnable( int isEnable ){
        this.isEnable = isEnable;
        }
}

