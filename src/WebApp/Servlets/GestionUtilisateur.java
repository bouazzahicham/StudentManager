package WebApp.Servlets;

import DAO.DAOBeans.DAOGroupeImpl;
import DAO.DAOBeans.DAOUtilisateurImpl;
import DAO.DAOBeans.EleveImpl;
import DAO.DAOFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * Created by Hicham on 30/01/2018.
 */
public class GestionUtilisateur extends HttpServlet
{
    private DAOFactory daoFactory;
    private DAOGroupeImpl daoGroupe;
    private DAOUtilisateurImpl daoUtilisateur ;
    @Override
    public void init() throws ServletException
    {
        daoFactory = (DAOFactory) getServletContext().getAttribute("daoFactory");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        daoGroupe = ((DAOFactory)getServletContext().getAttribute("daoFactory")).getGroupeDao();
        daoUtilisateur = ((DAOFactory)getServletContext().getAttribute("daoFactory")).getUtilisateurDao();
        String chemin = req.getRequestURI().substring(req.getContextPath().length());
        Map<String, String[]> theMap = req.getParameterMap();


        if (theMap.size() == 1)
        {
            if (theMap.containsKey("Ajouter"))
            {
                req.getServletContext().getRequestDispatcher("/WEB-INF/site/utilisateurs/ajouterUtilisateur.jsp").forward(req, resp);
            }
            else
            {
                req.setAttribute("utilisateurs",daoUtilisateur.lister(-1));
                req.getServletContext().getRequestDispatcher("/WEB-INF/site/utilisateurs/gestionUtilisateur.jsp").forward(req, resp);
            }

        }
        else
        {
            req.getServletContext().getRequestDispatcher("/WEB-INF/site/utilisateurs/gestionUtilisateur.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {

        if(req.getParameter("ajouterUtilisateur").equals("ajouterUtilisateur"))
            formulaireAjoutUtilisateur(req,resp);


    }

    private void formulaireAjoutUtilisateur(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Map<String,String[]> utilisateurAjout = req.getParameterMap();
        DAOUtilisateurImpl utilisateur = daoFactory.getUtilisateurDao();

        utilisateur.ajouter(utilisateurAjout.get("nomProprietaire")[0],utilisateurAjout.get("prenomProprietaire")[0],utilisateurAjout.get("idProfil")[0],utilisateurAjout.get("motdePasse")[0],utilisateurAjout.get("idUtilisateur")[0],utilisateurAjout.get("descriptionUtilisateur")[0]);
        resp.sendRedirect(req.getContextPath()+"/gestionUtilisateur");


        //Creer un historique
        //Update des gestionSeances selon son groupe !
        // ###AFAIRE## Taitemente des evaluations !


    }


}

