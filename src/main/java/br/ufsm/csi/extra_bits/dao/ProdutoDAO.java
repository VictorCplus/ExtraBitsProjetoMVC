package br.ufsm.csi.extra_bits.dao;

import br.ufsm.csi.extra_bits.model.Produto;

import java.sql.*;
import java.util.ArrayList;

public class ProdutoDAO {

    private String sql;

    private PreparedStatement preparedStatement;

    private ResultSet resultSet;

    private String status;


    public ArrayList<Produto> getProdutos(){

        ArrayList<Produto> produtos = new ArrayList<>();
        try (Connection connection = new ConexaoBD().getConexao()){

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from produto");

            while (resultSet.next()){
                Produto produto = new Produto();
                produto.setId_produto(resultSet.getInt("id_produto"));
                produto.setNome(resultSet.getString("nome"));
                produto.setDescricao(resultSet.getString("descricao"));
                produto.setValor(resultSet.getFloat("valor"));
                produto.setCategoria(resultSet.getString("categoria"));
                produto.setImagem(resultSet.getString("imagem"));
                produto.setData_adicionado(resultSet.getDate("data_adicionado"));
                produtos.add(produto);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return produtos;
    }

    public String cadastroProduto(Produto produto){

        try(Connection connection = new ConexaoBD().getConexao()){

            connection .setAutoCommit(false);

            this.sql = "insert into produto (imagem, nome, categoria, descricao, valor, data_adicionado) \n" +
                    "values (?, ?, ?, ?, ? , CURRENT_DATE);";
            this.preparedStatement = connection.prepareStatement(this.sql, preparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, produto.getImagem());
            preparedStatement.setString(2, produto.getNome());
            preparedStatement.setString(3, produto.getCategoria());
            preparedStatement.setString(4, produto.getDescricao());
            preparedStatement.setFloat(5, produto.getValor());
            System.out.println(preparedStatement);

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

        return null;
    }

    public Produto getProduto(int id){

        Produto produto = null;

        try (Connection connection = new ConexaoBD().getConexao()){

            this.sql = "select * from produto where id_produto = ?";

            preparedStatement = connection.prepareStatement(this.sql);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                produto = new Produto();
                produto.setId_produto(resultSet.getInt("id_produto"));
                produto.setNome(resultSet.getString("nome"));
                produto.setDescricao(resultSet.getString("descricao"));
                produto.setValor(resultSet.getFloat("valor"));
                produto.setCategoria(resultSet.getString("categoria"));
                produto.setImagem(resultSet.getString("imagem"));
                produto.setData_adicionado(resultSet.getDate("data_adicionado"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return produto;
    }

    public String editarProduto(Produto produto){

        try (Connection connection = new ConexaoBD().getConexao()){

            connection.setAutoCommit(false);

            this.sql = "update produto " +
                    "set " +
                    "nome = ?, " +
                    "categoria = ?, " +
                    "valor = ?, " +
                    "descricao = ?," +
                    "imagem = ? " +
                    "where " +
                    "id_produto = ?";

            this.preparedStatement = connection.prepareStatement(this.sql);
            this.preparedStatement.setString(1, produto.getNome());
            this.preparedStatement.setString(2, produto.getCategoria());
            this.preparedStatement.setFloat(3, produto.getValor());
            this.preparedStatement.setString(4, produto.getDescricao());
            this.preparedStatement.setString(5, produto.getImagem());
            this.preparedStatement.setInt(6, produto.getId_produto());
            this.preparedStatement.execute();

            if(this.preparedStatement.getUpdateCount() > 0){
                this.status = "OK";
                connection.commit();
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return "";
    }

    public String deletarProduto(int id){

        try(Connection connection = new ConexaoBD().getConexao()){

            connection.setAutoCommit(false);

            this.sql = "delete from produto where id_produto = ?";
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
