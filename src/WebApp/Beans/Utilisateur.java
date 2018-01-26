package WebApp.Beans;

/**
 * Created by Hicham on 26/01/2018.
 */
public class Utilisateur
{


    private String profil;
    private long id;
    private String nom;
    private String prenom;
    private String description;

    public void setId(long id)
    {
        this.id = id;
    }

    public void setProfil(String profil)
    {
        this.profil = profil;
    }


    public void setPrenom(String prenom)
    {
        this.prenom = prenom;
    }

    public void setNom(String nom)
    {
        this.nom = nom;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }
}
