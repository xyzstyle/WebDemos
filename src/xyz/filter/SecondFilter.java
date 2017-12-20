package xyz.filter;

import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by xyz in WebDemos on 2017/12/20 .
 */
public class SecondFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        PrintWriter out = servletResponse.getWriter();
        out.println("Filter 2 is doing!!!<br>");
        filterChain.doFilter(servletRequest, servletResponse);
        out.println("<br>Filter 2's work is done");
    }

    @Override
    public void destroy() {

    }
}
