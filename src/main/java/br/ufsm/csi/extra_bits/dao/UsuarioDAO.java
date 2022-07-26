package br.ufsm.csi.extra_bits.dao;

import br.ufsm.csi.extra_bits.model.Usuario;

import java.sql.*;

public class UsuarioDAO {

    private String sql;

    private Statement statement;

    private ResultSet resultSet;

    private PreparedStatement preparedStatement;

    private String status;

    public Usuario getUsuario(String email, String senha){

        Usuario user = null;

        try(Connection connection = new ConexaoBD().getConexao()){

            this.sql = "SELECT * FROM" +
                    "usuario" +
                    "WHERE" +
                    "usuario.email = ?" +
                    "AND" +
                    "usuario.senha = ?";

            preparedStatement = connection.prepareStatement(this.sql);
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,senha);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                user = new Usuario();
                user.setId_usuario(resultSet.getInt("id_usuario"));
                user.setNome(resultSet.getString("nome"));
                user.setEmail(resultSet.getString("email"));
                user.setCpf(resultSet.getString("cpf"));
                user.setSenha(resultSet.getString("senha"));
                user.setTelefone(resultSet.getString("telefone"));
                user.setData_nascimento(resultSet.getDate("data_nascimento"));
                user.setData_cadastro(resultSet.getDate("data_cadastro"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return user;
    }

}
