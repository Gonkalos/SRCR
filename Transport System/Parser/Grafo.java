import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import static java.lang.Math.pow;
import static java.lang.Math.sqrt;

public class Grafo {

    private Map<Integer,Paragem> paragens;
    private Map<Integer,MyEntry<Integer,Integer>> origensDestinos; // id -> gid
    private Map<Integer,MyEntry<Integer,Double>> carreiraDistancia; // id -> carreira, distância
    private Map<Integer, Set<Integer>> carreiras; // gid -> carreiras

    private static int id = 0;


    // Construtor
    public Grafo () {
        this.paragens = new HashMap<>();
        this.origensDestinos = new HashMap<>();
        this.carreiraDistancia = new HashMap<>();
        this.carreiras = new HashMap<>();
    }


    // Adicionar Adjacência de Paragens
    public void addAdjacencia (Paragem origem, Paragem destino, int carreira){

        if (origem != null && destino != null) {

            int gidOrigem = origem.getGid();
            int gidDestino = destino.getGid();

            if (gidOrigem != gidDestino) {

                if (!this.paragens.containsKey(gidOrigem)) this.paragens.put(gidOrigem, origem);

                if (!this.paragens.containsKey(gidDestino)) this.paragens.put(gidDestino, destino);

                if (!this.carreiras.containsKey(gidOrigem)) this.carreiras.put(gidOrigem, new HashSet<>());

                if (!this.carreiras.containsKey(gidDestino)) this.carreiras.put(gidDestino, new HashSet<>());

                MyEntry<Integer, Integer> entry1 = new MyEntry<>(origem.getGid(), destino.getGid());
                this.origensDestinos.put(id, entry1);

                double x = destino.getLatitude() - origem.getLatitude();
                double y = destino.getLongitude() - origem.getLongitude();
                double distancia = sqrt(pow(x, 2) + pow(y, 2));
                MyEntry<Integer, Double> entry2 = new MyEntry<>(carreira, distancia);
                this.carreiraDistancia.put(id, entry2);

                this.carreiras.get(gidOrigem).add(carreira);
                this.carreiras.get(gidDestino).add(carreira);

                this.id++;
            }
        }
    }


    // toString das adjacências
    public String adjacenciasToString () {
        StringBuilder sb = new StringBuilder();
        for (int id : this.origensDestinos.keySet()){
            MyEntry<Integer,Integer> entry1 = this.origensDestinos.get(id);
            MyEntry<Integer,Double> entry2 = this.carreiraDistancia.get(id);
            sb.append("adjacente(" + entry1.getKey() + ", " + entry1.getValue() +  ", " + entry2.getKey() + ", " + entry2.getValue() + ").\n");
        }
        return sb.toString();
    }

    // toString das paragens
    public String paragensToString () {
        StringBuilder sb = new StringBuilder();
        for (int id : this.paragens.keySet()){
            Paragem p = this.paragens.get(id);
            sb.append("paragem(" + p.getGid() + ", " + p.getLatitude() + ", " + p.getLongitude() + ", " + p.getEstado() + ", " + p.getTipoAbrigo() +
                    ", " + p.getPublicidade() + ", " + p.getOperadora() + ", " + p.getCodigoRua() + ", " + p.getNomeRua() + ", " + p.getFreguesia() + ").\n");
        }
        return sb.toString();
    }

    // toStrong das carreiras de cada paragem
    public String carreirasToString () {
        StringBuilder sb = new StringBuilder();
        for (int gid : this.carreiras.keySet()){
            Set<Integer> set = this.carreiras.get(gid);
            sb.append("carreiras(" + gid + ", [");
            int i = 1;
            int size = set.size();
            for (int carreira : set){
                if (i < size) sb.append(carreira + ", ");
                else sb.append(carreira + "]).\n");
                i++;
            }
        }
        return sb.toString();
    }
}
