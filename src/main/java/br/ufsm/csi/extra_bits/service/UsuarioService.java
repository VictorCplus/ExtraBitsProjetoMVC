package br.ufsm.csi.extra_bits.service;

import br.ufsm.csi.extra_bits.dao.UsuarioDAO;
import br.ufsm.csi.extra_bits.model.Usuario;

public class UsuarioService {

    private UsuarioDAO dao;

    public Usuario autenticado(String email, String senha){

        dao = new UsuarioDAO();

        Usuario user = dao.getUsuario(email, senha);

        try{
            if(user.getEmail().equals(email) && user.getSenha().equals(senha)){
                return user;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

}
