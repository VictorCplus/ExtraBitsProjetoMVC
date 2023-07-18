package br.ufsm.csi.extra_bits.dao;

import br.ufsm.csi.extra_bits.model.CarrinhoCompra;
import br.ufsm.csi.extra_bits.model.Produto;
import org.springframework.util.StringUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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

            connection.setAutoCommit(false);

            this.sql = "insert into produto (imagem, nome, categoria, descricao, valor, data_adicionado) \n" +
                    "values (?, ?, ?, ?, ? , CURRENT_DATE);";
            this.preparedStatement = connection.prepareStatement(this.sql, preparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, produto.getImagem());
            preparedStatement.setString(2, produto.getNome());
            preparedStatement.setString(3, produto.getCategoria());
            preparedStatement.setString(4, produto.getDescricao());
            preparedStatement.setFloat(5, produto.getValor());


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

    public String historicoProduto(Produto produto){

        try(Connection connection = new ConexaoBD().getConexao()){

            connection.setAutoCommit(false);

            this.sql = "insert into historicoproduto (id_produto, nome, categoria, valor, descricao, imagem, data_adicionado) " +
                    "values (?, ?, ?, ?, ?, ?, ?)";
            this.preparedStatement = connection.prepareStatement(this.sql, preparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, produto.getId_produto());
            preparedStatement.setString(2, produto.getNome());
            preparedStatement.setString(3, produto.getCategoria());
            preparedStatement.setFloat(4, produto.getValor());
            preparedStatement.setString(5, produto.getDescricao());
            preparedStatement.setString(6, produto.getImagem());
            preparedStatement.setDate(7, produto.getData_adicionado());
            System.out.println(preparedStatement);

            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if(this.resultSet.getInt(1) >0){
                this.status = "OK";
                connection.commit();
            }
        }catch (SQLException e){
            e.printStackTrace();
            this.status = "ERROR";
        }
        return null;
    }

    public ArrayList<Produto> getProdutosHist(List<CarrinhoCompra> id){

        ArrayList<Produto> produtos = new ArrayList<>();
        try (Connection connection = new ConexaoBD().getConexao()){
            for(CarrinhoCompra compra : id) {
                this.sql = "select * from historicoproduto where id_produto = ?";
                preparedStatement = connection.prepareStatement(this.sql);
                preparedStatement.setInt(1, compra.getId_produto());
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
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
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return produtos;
    }

    public List<CarrinhoCompra> getHistoricoTotal() {
        List<CarrinhoCompra> historico = new ArrayList<>();

        try (Connection connection = new ConexaoBD().getConexao()) {
            this.sql = "select * from carrinhocompra";
            preparedStatement = connection.prepareStatement(this.sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                CarrinhoCompra hist = new CarrinhoCompra();
                hist.setId_compra(resultSet.getInt("id_compra"));
                hist.setId_usuario(resultSet.getInt("id_usuario"));
                hist.setId_produto(resultSet.getInt("id_produto"));
                hist.setData_compra(resultSet.getDate("data_compra"));
                historico.add(hist);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return historico;
    }

    public ArrayList<Produto> getProdutosHistTotal(){

        ArrayList<Produto> produtos = new ArrayList<>();
        try (Connection connection = new ConexaoBD().getConexao()){

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from historicoproduto");

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


    public List<CarrinhoCompra> getHistorico(int id) {
        List<CarrinhoCompra> historico = new ArrayList<>();

        try (Connection connection = new ConexaoBD().getConexao()) {
            this.sql = "select * from carrinhocompra where id_usuario = ?";
            preparedStatement = connection.prepareStatement(this.sql);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                CarrinhoCompra hist = new CarrinhoCompra();
                hist.setId_compra(resultSet.getInt("id_compra"));
                hist.setId_usuario(resultSet.getInt("id_usuario"));
                hist.setId_produto(resultSet.getInt("id_produto"));
                hist.setData_compra(resultSet.getDate("data_compra"));
                historico.add(hist);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return historico;
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

    public String comprarProduto(CarrinhoCompra compra){

        try(Connection connection = new ConexaoBD().getConexao()){

            connection.setAutoCommit(false);

            this.sql = "insert into carrinhocompra (id_usuario, id_produto, data_compra) " +
                    "values (?, ?, CURRENT_DATE)";
            this.preparedStatement = connection.prepareStatement(this.sql, preparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, compra.getId_usuario());
            preparedStatement.setInt(2, compra.getId_produto());
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

    public ArrayList<Produto> getPesquisa(String pesquisa) {
        ArrayList<Produto> produtos = new ArrayList<>();

        try (Connection connection = new ConexaoBD().getConexao()) {
            String sql;
            ResultSet resultSet;
            PreparedStatement preparedStatement;

            pesquisa = pesquisa.trim();

            if (StringUtils.endsWithIgnoreCase(pesquisa, "s")) {
                pesquisa = pesquisa.substring(0, pesquisa.length() - 1);
            }

            String pesquisaLowerCase = pesquisa.toLowerCase();

            sql = "SELECT * FROM produto WHERE LOWER(produto.categoria) LIKE ? OR LOWER(produto.nome) LIKE ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + pesquisaLowerCase + "%");
            preparedStatement.setString(2, "%" + pesquisaLowerCase + "%");
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
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

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return produtos;
    }


}
