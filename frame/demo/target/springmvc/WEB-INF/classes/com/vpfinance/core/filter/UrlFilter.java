package com.vpfinance.core.filter;

import com.vpfinance.util.ServletUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UrlFilter implements Filter {
    public static Log log = LogFactory.getLog(UrlFilter.class);

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
		String action = req.getRequestURI();
//		log.info("UrlFilter===action==>" + action);
//		if (!action.contains("callbackcash")&&!action.endsWith("/")&&!action.contains(".")&&!action.contains("admin/")) {
//			resp.sendRedirect(ServletUtil.getServerPath(req) + "/index.html");
//		}
//		if (action.contains("mobile/appChangePassword") || action.contains("mobile/appInverstRecord") || action.contains("mobile/appMoneyFlow") || action.contains("mobile/appMessage")
//		 || action.contains("mobile/appPersonalAccount") || action.contains("mobile/appPersonInfo") || action.contains("mobile/appRecommend") || action.contains("mobile/appViewMoney")
//		 || action.contains("mobile/appViewMoney2") || action.contains("mobile/appViewMoney3") || action.contains("mobile/appOtherGetMoney")) {
//			HttpSession session = req.getSession();
//			//TODO
//		}
        chain.doFilter(request, response);

    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }

}
