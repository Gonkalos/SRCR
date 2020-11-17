import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Paragem {

    private int gid;
    private double latitude;
    private double longitude;
    private String estado;
    private String tipoAbrigo;
    private String publicidade;
    private String operadora;
    //private List<Integer> carreiras;
    private int codigoRua;
    private String nomeRua;
    private String freguesia;


    // Construtor
    public Paragem (int gid, double latitude, double longitude, String estado, String tipoAbrigo, String publicidade,
                    String operadora, int codigoRua, String nomeRua, String freguesia) {

        this.gid = gid;
        this.latitude = latitude;
        this.longitude = longitude;
        this.estado = estado;
        this.tipoAbrigo = tipoAbrigo;
        this.publicidade = publicidade;
        this.operadora = operadora;
        this.codigoRua = codigoRua;
        this.nomeRua = nomeRua;
        this.freguesia = freguesia;
    }

    // Get gid
    public int getGid () {
        return this.gid;
    }

    // Get latitude
    public double getLatitude () {
        return this.latitude;
    }

    // Get longitude
    public double getLongitude () {
        return this.longitude;
    }

    // Get estado
    public String getEstado () {
        return this.estado;
    }

    // Get tipo de abrigo
    public String getTipoAbrigo () {
        return this.tipoAbrigo;
    }

    // Get tem publicidade
    public String getPublicidade () {
        return this.publicidade;
    }

    // Get operadora
    public String getOperadora () {
        return this.operadora;
    }

    // Get código de rua
    public int getCodigoRua () {
        return this.codigoRua;
    }

    // Get nome da rua
    public String getNomeRua () {
        return this.nomeRua;
    }

    // Get freguesia
    public String getFreguesia () {
        return this.freguesia;
    }
}
