package br.ufsm.csi.extra_bits.model;

import java.sql.Date;

public class Usuario {

    private int id_usuario;

    private String nome;

    private String email;

    private String cpf;

    private String senha;

    private String telefone;

    private Date data_nascimento;

    private Date data_cadastro;

    public Usuario(){

    }

    public Usuario(int id_usuario, String nome, String email, String cpf, String senha, String telefone, Date data_nascimento, Date data_cadastro) {
        this.id_usuario = id_usuario;
        this.nome = nome;
        this.email = email;
        this.cpf = cpf;
        this.senha = senha;
        this.telefone = telefone;
        this.data_nascimento = data_nascimento;
        this.data_cadastro = data_cadastro;
    }

    public Usuario(String nome, String email, String cpf, String senha, String telefone, String data_nascimento) {
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Date getData_nascimento() {
        return data_nascimento;
    }

    public void setData_nascimento(Date data_nascimento) {
        this.data_nascimento = data_nascimento;
    }

    public Date getData_cadastro() {
        return data_cadastro;
    }

    public void setData_cadastro(Date data_cadastro) {
        this.data_cadastro = data_cadastro;
    }
}
