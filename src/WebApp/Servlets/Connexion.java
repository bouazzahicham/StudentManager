package WebApp.Servlets;

import DAO.DAOBeans.DAOUtilisateurImpl;
import DAO.DAOFactory;
import WebApp.Beans.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
        List<String> erreursConnexion = new ArrayList<String>();
        req.setAttribute("erreursConnexion", erreursConnexion);


        String idUtilisateur = req.getParameter("username");
        String password = req.getParameter("password");


        System.out.println("username : " + idUtilisateur + "\n password : " + password);
        Utilisateur utilisateur = null;

//        utilisateur = DAO_utilisateur.charger(Integer.parseInt(idUtilisateur),password);
        // No worries about the type, PreparedStatement does the conversion
        try
        {
            utilisateur = DAO_utilisateur.charger(idUtilisateur, password);
        } catch (NullPointerException excception)
        {
            erreursConnexion.add("ErreurBDD : Erreur lors de la connexion avec la base de donnée ");
        }

        System.out.println("L'objet utilisateur : \n \t" + utilisateur);

        if (utilisateur != null)
        {
            if (utilisateur.getProfil().equals("-1"))
            {
                erreursConnexion.add("Erreur : Compte non autorisé à se connecter");
                this.getServletContext().getRequestDispatcher("/WEB-INF/site/connexion.jsp").forward(req,resp);

            }
            else
            {
                HttpSession session = req.getSession();
            session.setAttribute("utilisateur",utilisateur);
            resp.sendRedirect(req.getContextPath()+"/accueil");
            }

        }
        else
        {
            erreursConnexion.add("Erreur de compte : Username/Password incorrects !");
            this.getServletContext().getRequestDispatcher("/WEB-INF/site/connexion.jsp").forward(req,resp);

        }

        for (String e : erreursConnexion)
        {
            System.out.println(e);
        }
        // Traitement du Branchement conditionnel, compte banni ou non

    }
}
