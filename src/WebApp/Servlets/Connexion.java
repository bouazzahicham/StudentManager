package WebApp.Servlets;

import DAO.DAOBeans.DAOUtilisateur;
import DAO.DAOBeans.DAOUtilisateurImpl;
import DAO.DAOFactory;
import DAO.DAOUtilitaire;
import WebApp.Beans.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Hicham on 22/01/2018.
 */
public class Connexion extends HttpServlet
{
    private DAOUtilisateurImpl DAO_utilisateur;
    @Override
    public void init() throws ServletException
    {

        DAO_utilisateur = (DAOUtilisateurImpl) ((DAOFactory)getServletContext().getAttribute("daoFactory")).getUtilisateurDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        this.getServletContext().getRequestDispatcher("/WEB-INF/site/connexion.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {

        String idUtilisateur = req.getParameter("username");
        String password = req.getParameter("password");


        System.out.println("username : " + idUtilisateur+ "\n password : " +password);
        Utilisateur utilisateur = null ;

//        utilisateur = DAO_utilisateur.charger(Integer.parseInt(idUtilisateur),password);
        utilisateur = DAO_utilisateur.charger(1,"0");
        System.out.println("L'objet utilisateur : \n \t"+utilisateur);


    }
}
