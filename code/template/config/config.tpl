

  <message-resources parameter="ApplicationResources_zh_cn"  null="false"/>
  <plug-in className="org.apache.struts.validator.ValidatorPlugIn">
    <set-property value="/WEB-INF/validator-rules.xml,/WEB-INF/validation.xml" property="pathnames" />
  </plug-in>
  
    <bean id="messageSource" class="org.springframework.context.support.ResourceBundleMessageSource">
        <property name="basename">
        <!-- ????????????? -->
        <value>/WEB-INF/message</value>
        </property>
    </bean>

    <!-- ??Cookie??????? -->
    <bean id="localeResolver" class="org.springframework.web.servlet.i18n.CookieLocaleResolver">
        <property name="cookieMaxAge" value="604800"/>
        <property name="defaultLocale" value="zh_CN"/>
        <property name="cookieName" value="Language"></property>
    </bean>