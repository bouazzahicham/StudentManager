package WebApp.Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Hicham on 22/01/2018.
 */
//@WebServlet("/Accueil")
public class Accueil extends HttpServlet
{
//L'accueil

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {

        System.out.println("On a atteint cette partie ");
        req.getServletContext().getRequestDispatcher("/WEB-INF/site/accueil.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        super.doPost(req, resp);
    }
}
