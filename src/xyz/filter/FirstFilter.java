package xyz.filter;

import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by xyz in WebDemos on 2017/12/20 .
 */
public  class FirstFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding("utf-8");
        servletResponse.setContentType("text/html;charset=utf-8");
        PrintWriter out = servletResponse.getWriter();
        out.println("Filter 1 is doing!!!<br>");
        filterChain.doFilter(servletRequest, servletResponse);
        out.println("<br>Filter 1's work is done");

    }

    @Override
    public void destroy() {

    }
}
