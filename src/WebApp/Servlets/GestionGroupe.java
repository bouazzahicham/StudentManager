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
public class GestionGroupe extends HttpServlet
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
                req.getServletContext().getRequestDispatcher("/WEB-INF/site/groupes/ajouterGroupe.jsp").forward(req, resp);
            }
            else
            {
                req.setAttribute("groupeListe",daoGroupe.lister());
                System.out.println(daoEleve.lister(-1));
                req.getServletContext().getRequestDispatcher("/WEB-INF/site/groupes/gestionGroupe.jsp").forward(req, resp);
            }

        }
        else
        {
            req.getServletContext().getRequestDispatcher("/WEB-INF/site/groupes/gestionGroupe.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {

        if(req.getParameter("ajouterGroupe").equals("ajouterGroupe"))
            formulaireAjoutGroupe(req,resp);
        resp.sendRedirect(req.getContextPath()+"/gestionGroupe");

    }

    private void formulaireAjoutGroupe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        DAOGroupeImpl daoGroupeImpl = daoFactory.getGroupeDao();

        Map<String,String[]> groupeAjout = req.getParameterMap();
        String[] checkedId = req.getParameterValues("checked");

        daoGroupeImpl.ajouter(groupeAjout.get("nomGroupe")[0],groupeAjout.get("descriptionGroupe")[0]);

//        On va modifier cette place la
//        eleve.ajouter(req.getParameter("nomEleve"),req.getParameter("prenomEleve"),req.getParameter("dateNaissance"),
//                req.getParameter("telephone"),req.getParameter("description"),req.getParameter("ville"),req.getParameter("selectGroupe"));



        //Creer un historique
        //Update des gestionSeances selon son groupe !
        // ###AFAIRE## Taitemente des evaluations !


    }


}

