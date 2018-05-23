/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tiendaroparafa.modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sistemas
 */
public class TiendaRopaDB {

    private Connection conectar = null;


    public String[][] hacerConsulta(String consulta, int cantRegs, int cantCols) {
        String[][] resultado = new String[cantRegs][cantCols];
        testMySQLDriver();
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/tiendaroparafa", "root", "");
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(consulta);
            int i = 0;
            //System.out.println("Consulta hecha:\n");

            while (rs.next()) {
                //System.out.println("  registro num: " + i +"\n");
                for (int j = 0; j < cantCols; j++) {
                    //System.out.println("  col: " + j );
                    resultado[i][j] = rs.getString(j + 1);
                    //System.out.println("    valor: "+ rs.getString(j + 1)  +"\n");
                }
                i++;
            }

            rs.close();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return resultado;
    }
    
    
    public int cantClientes() {
        String consulta = "SELECT count(codCli) FROM Clientes;";
        int cant = Integer.parseInt(hacerConsulta(consulta, 1, 1)[0][0]);
        return cant;
    }

    public int cantEstadosPed() {
        String consulta = "SELECT count(codEstadoPed) FROM EstadosPedido;";
        int cant = Integer.parseInt(hacerConsulta(consulta, 1, 1)[0][0]);
        return cant;
    }

    public int cantTiposPagoPed() {
        String consulta = "SELECT count(codTipoPago) FROM TiposPago;";
        int cant = Integer.parseInt(hacerConsulta(consulta, 1, 1)[0][0]);
        return cant;
    }

    public int cantFuentesPed() {
        String consulta = "SELECT count(codFuentePed) FROM FuentesPedido;";
        int cant = Integer.parseInt(hacerConsulta(consulta, 1, 1)[0][0]);
        return cant;
    }

    public String[][] todosDatosClientes() {
        String[][] resultado = null;
        int cantClientes = cantClientes();

        String consulta = ""
                + "SELECT *"
                + " FROM Clientes;";

        resultado = hacerConsulta(consulta, cantClientes, 8);
        return resultado;
    }

    public String[][] todosDatosEstadoPed() {
        String[][] resultado = null;
        int cantEstadosPed = cantEstadosPed();

        String consulta = ""
                + "SELECT *"
                + " FROM EstadosPedido;";

        resultado = hacerConsulta(consulta, cantEstadosPed, 2);
        return resultado;
    }
        public String[][] todosDatosTiposPago() {
        String[][] resultado = null;
        int cantFuentesPed = cantFuentesPed();

        String consulta = ""
                + "SELECT *"
                + " FROM FuentesPedido;";

        resultado = hacerConsulta(consulta, cantFuentesPed, 2);
        return resultado;
    }
            public String[][] todosDatosFuentesPed() {
        String[][] resultado = null;
        int cantEstadosPed = cantEstadosPed();

        String consulta = ""
                + "SELECT *"
                + " FROM EstadosPedido;";

        resultado = hacerConsulta(consulta, cantEstadosPed, 2);
        return resultado;
    }
    
        public String[] datosPedido(String codPedido) {
        String[] resultado = null;
        String consulta = ""
                + "SELECT *"
                + " FROM Pedidos"
                + " WHERE codPedido=" + codPedido + ";";

        resultado = hacerConsulta(consulta, 1, 7)[0];
        return resultado;
    }

    public String[] datosCliente(String codCliente) {
        String[] resultado = null;
        String consulta = ""
                + "SELECT *"
                + " FROM Clientes"
                + " WHERE codCli=" + codCliente + ";";

        resultado = hacerConsulta(consulta, 1, 8)[0];
        return resultado;
    }



    private static void testMySQLDriver() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();

        } catch (Exception ex) {

            System.out.println("Error. No se cargo DB DRIVER");
        }

    }

    public static void main(String args[]) {
        TiendaRopaDB db = new TiendaRopaDB();
        String consulta = ""
                + "SELECT *"
                + " FROM Pedidos"
                + " WHERE codPedido=" + 1 + ";";
        db.hacerConsulta(consulta, 1, 7);
    }
}
