package br.ufsm.csi.extra_bits.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexaoBD {

    private static final String DRIVER = "org.postgresql.Driver";

    private static final String URL = "jdbc:postgresql://localhost:5432/extrabits";

    private static final String USER = "postgres";

    private static final String SENHA = "1234";


    public Connection getConexao() {
        Connection con = null;

        try {

            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USER, SENHA);

        }catch (Exception e){
            e.printStackTrace();
        }

        return con;
    }

}
