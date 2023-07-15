package br.ufsm.csi.extra_bits.model;

import java.sql.Date;

public class Produto {

    private int id_produto;

    private String nome;

    private String categoria;

    private float valor;

    private String descricao;

    private String imagem;

    private Date data_adicionado;


    public Date getData_adicionado() {
        return data_adicionado;
    }

    public void setData_adicionado(Date data_adicionado) {
        this.data_adicionado = data_adicionado;
    }


    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

}
