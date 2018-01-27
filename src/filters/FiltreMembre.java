package filters;


import WebApp.Beans.*;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


//A ameliorer : Pas encore au point


public class FiltreMembre implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException
    {


    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException
    {
        HttpServletRequest request = (HttpServletRequest) servletRequest ;
        HttpServletResponse response = (HttpServletResponse) servletResponse ;
            /* Non-filtrage des ressources statiques */
        String chemin = request.getRequestURI().substring( request.getContextPath().length() );

        if ( chemin.startsWith( "/inc" ) ) {
            filterChain.doFilter( request, response );
            return;
        }

        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
        //Parce qu'une session a OBLIGATOIREMENT un utilisateur connecté ! Autrement, on doit séparer session et notion d'utilisateur


        if(utilisateur == null )
        {
            if(chemin.equals("/servletConnexion"))
                filterChain.doFilter(request,response);
            else
                response.sendRedirect(request.getContextPath() + "/servletConnexion");
        }

        else
        {
            if(chemin.equals("/servletConnexion"))
                response.sendRedirect("/servletClient");
            else
                filterChain.doFilter(request, response);

        }


        // Condition pour eleminer toute les requetes

//    filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
