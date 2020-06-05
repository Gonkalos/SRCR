import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;

public class Main {

    public static void main(String[] args) {

        Grafo grafo = new Grafo();

        File excelFile = new File("/Users/goncaloalmeida/Documents/Universidade/SRCR/Trabalhos Individuais/Trabalho 2/lista_adjacencias_paragens.xls");
        Parser parser = new Parser(excelFile, grafo);
        parser.readExcel();

        File file = new File("/Users/goncaloalmeida/Documents/Universidade/SRCR/Trabalhos Individuais/Trabalho 2/factos.pl");

        try {

            FileWriter fileWriter = new FileWriter(file, true);
            BufferedWriter out = new BufferedWriter(fileWriter);
            out.write("% Inserção de Paragens\n\n");
            out.write("% Extensao do predicado paragem: Gid, Lat, Lon, Est, TAb, Pub, Ope, CRua, NRua, Fre -> {V,F}\n\n");
            out.write(grafo.paragensToString());
            out.write("\n\n% Inserção de Adjacências\n\n");
            out.write("% Extensao do predicado adjacencia: GidOrigem, GidDestino, Carreira, Distancia -> {V,F}\n\n");
            out.write(grafo.adjacenciasToString());
            out.write("\n\n% Inserção de Carreiras\n\n");
            out.write("% Extensao do predicado adjacencia: Gid, Carreiras -> {V,F}\n\n");
            out.write(grafo.carreirasToString());
            out.flush();
            out.close();

        }
        catch (IOException e){ e.printStackTrace(); }
    }
}
