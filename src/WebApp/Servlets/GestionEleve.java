package WebApp.Servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * Created by Hicham on 30/01/2018.
 */
public class GestionEleve extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String chemin = req.getRequestURI().substring(req.getContextPath().length());
        System.out.println(chemin);
        Map<String, String[]> theMap = req.getParameterMap();


        if (theMap.size() == 1)
        {
            if (theMap.containsKey("Ajouter"))
            {
                req.getServletContext().getRequestDispatcher("/WEB-INF/site/eleves/ajouterEleve.jsp").forward(req, resp);

            }

            if (theMap.containsKey("Rechercher"))
            {
                req.getServletContext().getRequestDispatcher("/WEB-INF/site/eleves/ajouterEleve.jsp").forward(req, resp);

            }




            else
            {
                req.getServletContext().getRequestDispatcher("/WEB-INF/site/eleves/gestionEleve.jsp").forward(req, resp);

            }

        }
        else
            {
                req.getServletContext().getRequestDispatcher("/WEB-INF/site/eleves/gestionEleve.jsp").forward(req, resp);

            }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        super.doPost(req, resp);
    }
}
