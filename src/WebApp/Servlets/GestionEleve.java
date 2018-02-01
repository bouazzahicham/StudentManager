package WebApp.Servlets;

import DAO.DAOBeans.DAOGroupeImpl;
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
public class GestionEleve extends HttpServlet
{
    private DAOFactory daoFactory;
    private DAOGroupeImpl daoGroupe;
    private EleveImpl daoEleve ;
    @Override
    public void init() throws ServletException
    {
        daoFactory = (DAOFactory) getServletContext().getAttribute("daoFactory");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        daoGroupe = ((DAOFactory)getServletContext().getAttribute("daoFactory")).getGroupeDao();
        daoEleve = ((DAOFactory)getServletContext().getAttribute("daoFactory")).geteleveImpl();
        String chemin = req.getRequestURI().substring(req.getContextPath().length());
        Map<String, String[]> theMap = req.getParameterMap();


        if (theMap.size() == 1)
        {
            if (theMap.containsKey("Ajouter"))
            {
                req.setAttribute("groupeListe",daoGroupe.lister());
                req.getServletContext().getRequestDispatcher("/WEB-INF/site/eleves/ajouterEleve.jsp").forward(req, resp);
            }
            else
            {
                req.setAttribute("eleves",daoEleve.lister(-1));
                System.out.println(daoEleve.lister(-1));
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

        System.out.println("On est dans le post #GestionEleve");
        if(req.getParameter("ajouterEleve").equals("ajouterEleve"))
            formulaireAjoutEleve(req,resp);


    }

    private void formulaireAjoutEleve(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Map<String,String[]> eleveAjout = req.getParameterMap();
        EleveImpl eleve = daoFactory.geteleveImpl();
        for(String e : eleveAjout.keySet())
        {
            System.out.println(e + "\t" + eleveAjout.get(e)[0]);
        }
        eleve.ajouter(req.getParameter("nomEleve"),req.getParameter("prenomEleve"),req.getParameter("dateNaissance"),
                req.getParameter("telephone"),req.getParameter("description"),req.getParameter("ville"),req.getParameter("selectGroupe"));

        resp.sendRedirect(req.getContextPath()+"/gestionEleve");


        //Creer un historique
        //Update des gestionSeances selon son groupe !
        // ###AFAIRE## Taitemente des evaluations !


    }


}

