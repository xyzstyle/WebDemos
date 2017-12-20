package xyz.filter;

import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by xyz in WebDemos on 2017/12/20 .
 */
public class IPFilter implements Filter {
    FilterConfig filterConfig;
    String ip;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
        this.ip = this.filterConfig.getInitParameter("ip");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        String remoteIP = servletRequest.getRemoteAddr();
        if (remoteIP.equals(ip)) {
            PrintWriter out = servletResponse.getWriter();
            out.print("<b>您的IP地址被禁止访问.</b>");
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }

    }

    @Override
    public void destroy() {

    }
}
