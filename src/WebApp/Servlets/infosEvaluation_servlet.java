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
        mysession=request.getSession();
        mysession.setAttribute("groupes",groupes.lister());
        mysession.setAttribute("evaluations",evaluations.lister());
        this.getServletContext().getRequestDispatcher("/WEB-INF/site/infos_evaluation.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("groupetds")!=null && request.getParameter("evaluations")!=null) {
            idGroupe=Integer.parseInt(request.getParameter("groupetds"));
            idevaluation=Integer.parseInt(request.getParameter("evaluations"));
            mysession.setAttribute("grselect", idGroupe);
            mysession.setAttribute("evselect", idevaluation);
            mysession.setAttribute("eleves", eva_eleves.lister_groupe(idGroupe,idevaluation));
        }

        this.getServletContext().getRequestDispatcher("/WEB-INF/site/infos_evaluation.jsp").forward(request, response);
    }

}
