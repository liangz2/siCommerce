/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package filters;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Icewill
 */
public class LoginFilter implements Filter {

    private FilterConfig filterConfig = null;
    private String homePage = "/";
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        ServletContext sc = filterConfig.getServletContext();
        
        HttpSession session = httpRequest.getSession();
        
        if (session.getAttribute("user") == null) {
            httpRequest.setAttribute("error", "You must login to use the POS system.");
            sc.getRequestDispatcher(homePage).forward(httpRequest, response);
        }
        
        chain.doFilter(httpRequest, response);
    }

    @Override
    public void destroy() {
        filterConfig = null;
    }
    
}
