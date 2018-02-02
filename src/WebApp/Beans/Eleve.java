package WebApp.Beans;

public class  Eleve{

    private Integer idEleve;
    private String nomEleve,prenomEleve;
    private Integer idGroupe ;
    private String telephoneEleve;

    private Integer pointsMaxEvaluation;

    public Integer getPointsMaxEvaluation()
    {
        return pointsMaxEvaluation;
    }

    public void setPointsMaxEvaluation(Integer pointsMaxEvaluation)
    {
        this.pointsMaxEvaluation = pointsMaxEvaluation;
    }

    public Integer getIdEleve()

    {
        return idEleve;
    }

    public void setIdEleve(Integer idEleve)
    {
        this.idEleve = idEleve;
    }

    public String getNomEleve()
    {
        return nomEleve;
    }

    public void setNomEleve(String nomEleve)
    {
        this.nomEleve = nomEleve;
    }

    public String getPrenomEleve()
    {
        return prenomEleve;
    }

    public void setPrenomEleve(String prenomEleve)
    {
        this.prenomEleve = prenomEleve;
    }

    public Integer getIdGroupe()
    {
        return idGroupe;
    }

    public void setIdGroupe(Integer idGroupe)
    {
        this.idGroupe = idGroupe;
    }

    public String getTelephoneEleve()
    {
        return telephoneEleve;
    }

    public void setTelephoneEleve(String telephoneEleve)
    {
        this.telephoneEleve = telephoneEleve;
    }
}
