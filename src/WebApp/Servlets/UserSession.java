package WebApp.Servlets;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Set;

public class UserSession extends HttpServlet implements HttpSessionBindingListener
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Set<UserSession> logins = (Set<UserSession>) getServletContext().getAttribute("logins");
        req.setAttribute("","");
        this.getServletContext().getRequestDispatcher(req.getRequestURI()).forward(req,resp);
    }

    @Override
    public void valueBound(HttpSessionBindingEvent event) {
        Set<UserSession> logins;
        logins = (Set<UserSession>) event.getSession().getServletContext().getAttribute("logins");
        logins.add(this);
    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent event) {
        Set<UserSession> logins = (Set<UserSession>) event.getSession().getServletContext().getAttribute("logins");
        logins.remove(this);
    }

    // @Override equals() and hashCode() as well!

}
