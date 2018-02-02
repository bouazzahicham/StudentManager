package WebApp.Servlets;

import DAO.DAOBeans.DAOGroupeImpl;
import DAO.DAOBeans.EvaluationImpl;
import DAO.DAOFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class infosEvaluation_servlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    private EvaluationImpl evaluations;
    private EvaluationImpl eva_eleves;
    private DAOGroupeImpl groupes;
    HttpSession mysession;
    Integer ideleve,idGroupe,idseance,idevaluation;


    public infosEvaluation_servlet() {
        super();
    }

    public void init() throws ServletException {
        DAOFactory daofact=DAOFactory.getInstance();
        this.evaluations=daofact.getevaluationImpl();
        this.groupes=daofact.getGroupeDao();
        this.eva_eleves=daofact.getevaluationImpl();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("groupes",groupes.lister());
        request.setAttribute("evaluations",evaluations.lister());
        this.getServletContext().getRequestDispatcher("/WEB-INF/site/infos_evaluation.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String a = request.getParameter("groupetds") ;
        String b= request.getParameter("evaluations") ;

        if(a !=null &&  !a.isEmpty()  &&  b != null && !b.isEmpty())
        {
            idGroupe=Integer.parseInt(a);
            idevaluation=Integer.parseInt(b);
            request.setAttribute("grselect", idGroupe);
            request .setAttribute("evselect", idevaluation);
            request.setAttribute("eleves", eva_eleves.lister_groupe(idGroupe,idevaluation));
        }


        doGet(request,response);
//        this.getServletContext().getRequestDispatcher("/WEB-INF/site/infos_evaluation.jsp").forward(request, response);
    }

}
