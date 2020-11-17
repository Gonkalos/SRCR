import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import java.io.File;
import java.io.IOException;
import java.text.Normalizer;

public class Parser {

    private File file;
    private Grafo grafo;


    // Construtor
    public Parser (File file, Grafo grafo) {
        this.file = file;
        this.grafo = grafo;
    }


    // Tratamento das strings
    private String formatString (String s) {

        if (s.isEmpty()) return "\'desconhecido\'";

        else {

            // Remover acentos
            String result = Normalizer.normalize(s, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");

            // Remover enters
            result.replaceAll("\r", "").replaceAll("\n", "");

            result = "\'" + result + "\'";

            return result;
        }
    }


    // ler do excel
    public void readExcel () {

        Workbook workbook = null;
        Paragem paragem = null;
        Paragem paragemAnterior = null;
        int carreira;
        int gid;
        double latitude;
        double longitude;
        String estado;
        String tipoAbrigo;
        String publidade;
        String operadora;
        int codigoRua;
        String nomeRua;
        String freguesia;

        try {

            workbook = Workbook.getWorkbook(this.file);
            int numSheets = workbook.getNumberOfSheets();
            int numLinhas = 0;

            for (int i = 0; i < numSheets; i++){

                Sheet sheet = workbook.getSheet(i);
                numLinhas = sheet.getRows();

                for (int j = 1; j < numLinhas; j++){

                    Cell c1 = sheet.getCell(0,j);
                    gid = Integer.parseInt(c1.getContents());

                    Cell c2 = sheet.getCell(1,j);
                    if (c2.getContents().isEmpty()) latitude = paragemAnterior.getLatitude() + 100;
                    else latitude = Double.parseDouble(c2.getContents());

                    Cell c3 = sheet.getCell(2,j);
                    if (c3.getContents().isEmpty()) longitude = paragemAnterior.getLongitude() + 100;
                    else longitude = Double.parseDouble(c3.getContents());

                    Cell c4 = sheet.getCell(3,j);
                    estado = formatString(c4.getContents());

                    Cell c5 = sheet.getCell(4,j);
                    tipoAbrigo = formatString(c5.getContents());

                    Cell c6 = sheet.getCell(5,j);
                    publidade = formatString(c6.getContents());

                    Cell c7 = sheet.getCell(6,j);
                    operadora = formatString(c7.getContents());

                    Cell c8 = sheet.getCell(7,j);
                    carreira = Integer.parseInt(c8.getContents());

                    Cell c9 = sheet.getCell(8,j);
                    codigoRua = Integer.parseInt(c9.getContents());

                    Cell c10 = sheet.getCell(9,j);
                    nomeRua = formatString(c10.getContents());

                    Cell c11 = sheet.getCell(10,j);
                    freguesia = formatString(c11.getContents());

                    paragem = new Paragem(gid, latitude, longitude, estado, tipoAbrigo, publidade, operadora, codigoRua, nomeRua, freguesia);

                    if (j > 1) grafo.addAdjacencia(paragemAnterior, paragem, carreira);

                    paragemAnterior = paragem;
                }
            }
        }
        catch (IOException | BiffException e) { e.printStackTrace(); }
    }
}
