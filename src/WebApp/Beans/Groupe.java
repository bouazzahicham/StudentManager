package WebApp.Beans;

/**
 * Created by Hicham on 28/01/2018.
 */

public class Groupe {

    Integer idGroupe;
    String nomGroupe,descriptionGroupe;
    public Integer getIdGroupe() {
        return idGroupe;
    }
    public void setIdGroupe(Integer idGroupe) {
        this.idGroupe = idGroupe;
    }
    public String getNomGroupe() {
        return nomGroupe;
    }
    public void setNomGroupe(String nomGroupe) {
        this.nomGroupe = nomGroupe;
    }
    public String getDescriptionGroupe() {
        return descriptionGroupe;
    }
    public void setDescriptionGroupe(String descriptionGroupe) {
        this.descriptionGroupe = descriptionGroupe;
    }
}
