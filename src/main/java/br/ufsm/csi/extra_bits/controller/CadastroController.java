package br.ufsm.csi.extra_bits.controller;


import br.ufsm.csi.extra_bits.dao.UsuarioDAO;
import br.ufsm.csi.extra_bits.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping("/cadastro")
public class CadastroController extends HttpServlet {

    @GetMapping("/cadastro_usuario")
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UsuarioDAO dao = new UsuarioDAO();
        String retorno = "";
        String opcao = req.getParameter("opcao");

        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String cpf = req.getParameter("cpf");
        String senha = req.getParameter("senha");
        String telefone = req.getParameter("telefone");
        String data_nascimento = req.getParameter("data_nascimento");

        Usuario user = new Usuario(nome, email, cpf, senha, telefone, data_nascimento);

    }


}
