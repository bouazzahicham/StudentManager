package WebApp.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DAOBeans.DAOGroupeImpl;
import DAO.DAOBeans.DAOSeanceImpl;
import DAO.DAOBeans.EleveImpl;
import DAO.DAOFactory;


public class Appel extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DAOGroupeImpl groupes;
    private DAOSeanceImpl seances;
    private EleveImpl eleves;
    HttpSession mysession;
    Integer idgroupe=null,idseance=null;

    public Appel() {
        super();
    }

    public void init() throws ServletException {
        DAOFactory daofact=DAOFactory.getInstance();
        this.groupes=daofact.getGroupeDao();
        this.seances=daofact.getSeanceDao();
        this.eleves=daofact.geteleveImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        mysession=request.getSession();

//        A modifier pour ajouter l'id de l'utilisatuer connecté
        mysession.setAttribute("groupes",groupes.lister_user(1));/* r�cup�ration du  parametre(id_utilisateur) apres authentification */



        this.getServletContext().getRequestDispatcher("/WEB-INF/site/appel.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        if(request.getParameter("groupetds")!=null) {
            idgroupe=Integer.parseInt(request.getParameter("groupetds"));
            mysession.setAttribute("grselect", idgroupe);
            mysession.setAttribute("seancesel", null);
        }
        if(request.getParameter("seances")!=null) {
            idseance=Integer.parseInt(request.getParameter("seances"));
            mysession.setAttribute("seancesel", idseance);
        }
        mysession=request.getSession();
        mysession.setAttribute("seances",seances.lister(1,idgroupe));/* recup�ration du premier parametre(id_utilisateur) apres authentfication*/
        mysession.setAttribute("eleves",eleves.lister(idgroupe));


        this.getServletContext().getRequestDispatcher("/WEB-INF/site/appel.jsp").forward(request, response);
    }


}
