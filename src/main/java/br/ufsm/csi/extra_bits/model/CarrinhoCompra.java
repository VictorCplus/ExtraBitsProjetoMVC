package br.ufsm.csi.extra_bits.model;

import java.util.Date;

public class CarrinhoCompra extends Produto {

    private int id_compra;

    private int id_usuario;

    private int id_produto;

    private Date data_compra;

    public int getId_compra() {
        return id_compra;
    }

    public void setId_compra(int id_compra) {
        this.id_compra = id_compra;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    @Override
    public int getId_produto() {
        return id_produto;
    }

    @Override
    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public Date getData_compra() {
        return data_compra;
    }

    public void setData_compra(Date data_compra) {
        this.data_compra = data_compra;
    }
}
