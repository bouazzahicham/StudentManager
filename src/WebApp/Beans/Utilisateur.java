package WebApp.Beans;

/**
 * Created by Hicham on 26/01/2018.
 */
public class Utilisateur
{


    private String idProfil;
    private String motdePasse;
    private String idUtilisateur;
    private String nomProprietaire;
    private String prenomProprietaire;
    private String descriptionUtilisateur;

    public String getIdProfil()
    {
        return idProfil;
    }

    public void setIdProfil(String idProfil)
    {
        this.idProfil = idProfil;
    }

    public String getMotdePasse()
    {
        return motdePasse;
    }

    public void setMotdePasse(String motdePasse)
    {
        this.motdePasse = motdePasse;
    }

    public String getIdUtilisateur()
    {
        return idUtilisateur;
    }

    public void setIdUtilisateur(String idUtilisateur)
    {
        this.idUtilisateur = idUtilisateur;
    }

    public String getNomProprietaire()
    {
        return nomProprietaire;
    }

    public void setNomProprietaire(String nomProprietaire)
    {
        this.nomProprietaire = nomProprietaire;
    }

    public String getPrenomProprietaire()
    {
        return prenomProprietaire;
    }

    public void setPrenomProprietaire(String prenomProprietaire)
    {
        this.prenomProprietaire = prenomProprietaire;
    }

    public String getDescriptionUtilisateur()
    {
        return descriptionUtilisateur;
    }

    public void setDescriptionUtilisateur(String descriptionUtilisateur)
    {
        this.descriptionUtilisateur = descriptionUtilisateur;
    }
}
