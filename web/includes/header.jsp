<%-- 
    Document   : top
    Created on : Jun 10, 2012, 8:58:32 PM
    Author     : Icewill
--%>
<%
    if (session.getAttribute("user") == null) {
        session.setAttribute("error", "You must login to use the POS system.");
        response.sendRedirect("../");
    }
%>

        
    
    
