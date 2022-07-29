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
                    " usuario " +
                    "WHERE" +
                    " usuario.email = ?" +
                    "AND" +
                    " usuario.senha = ?";

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

    public String cadastroUser(Usuario user){

        try (Connection connection = new ConexaoBD().getConexao()){

            connection.setAutoCommit(false);

            this.sql ="insert into usuario (nome, email, cpf, senha, telefone, data_nascimento, data_cadastro) " +
                    "values (?, ?, ?, ?, ?, ?, CURRENT_DATE);";

            this.preparedStatement = connection.prepareStatement(this.sql, preparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setString(1, user.getNome());
            this.preparedStatement.setString(2, user.getEmail());
            this.preparedStatement.setString(3, user.getCpf());
            this.preparedStatement.setString(4, user.getSenha());
            this.preparedStatement.setString(5, user.getTelefone());
            this.preparedStatement.setDate(6, user.getData_nascimento());

            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if(this.resultSet.getInt(1) > 0){
                this.status = "OK";
                connection.commit();
            }
        }catch (SQLException e){
            e.printStackTrace();
            this.status = "ERROR";
        }
        return this.status;
    }

    public Usuario getperfiluser(int id){
        Usuario usuario = null;

        try(Connection connection = new ConexaoBD().getConexao()){

            this.sql = "select * from usuario where id_usuario = ?";
            this.preparedStatement = connection.prepareStatement(this.sql);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                usuario = new Usuario();
                usuario.setId_usuario(resultSet.getInt("id_usuario"));
                usuario.setNome(resultSet.getString("nome"));
                usuario.setEmail(resultSet.getString("email"));
                usuario.setCpf(resultSet.getString("cpf"));
                usuario.setSenha(resultSet.getString("senha"));
                usuario.setTelefone(resultSet.getString("telefone"));
                usuario.setData_nascimento(resultSet.getDate("data_nascimento"));
                usuario.setData_cadastro(resultSet.getDate("data_cadastro"));
            }

        }catch (SQLException e){
            e.printStackTrace();
            this.status = "ERROR";
        }
        return usuario;
    }

    public String editaruser(Usuario user){

        try(Connection connection = new ConexaoBD().getConexao()){

            connection.setAutoCommit(false);

            this.sql = "update usuario set " +
                    "nome = ?, " +
                    "email = ?, " +
                    "cpf = ?, " +
                    "senha = ?, " +
                    "telefone = ?, " +
                    "data_nascimento = ? " +
                    "where id_usuario = ?;";

            this.preparedStatement = connection.prepareStatement(this.sql);

        }catch (SQLException e){
            e.printStackTrace();
        }
        return "";
    }



    public String deleteuser(int id){
        try(Connection connection = new ConexaoBD().getConexao()){
            connection.setAutoCommit(false);

            this.sql = "delete from usuario where id_usuario = ?";
            this.preparedStatement = connection.prepareStatement(this.sql);
            this.preparedStatement.setInt(1, id);
            this.preparedStatement.executeUpdate();

            if(this.preparedStatement.getUpdateCount() > 0){
                this.status = "OK";
                connection.commit();
            }
        }catch (SQLException e){
            e.printStackTrace();
            this.status = "OK";
        }
        return "";
    }




}
