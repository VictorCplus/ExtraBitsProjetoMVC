package br.ufsm.csi.extra_bits.controller;

import br.ufsm.csi.extra_bits.dao.UsuarioDAO;
import br.ufsm.csi.extra_bits.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.sql.Date;

@Controller
public class UserController {
    UsuarioDAO dao = new UsuarioDAO();


    @PostMapping("/cadastro")
    public RedirectView cadastro(@ModelAttribute("usuario") Usuario usuario){
        dao.cadastroUser(usuario);

        return new RedirectView("/home", true);
    }

    @GetMapping("/perfil")
    public String perfil(Model model, HttpSession session){
        Usuario usuario_logado = (Usuario) session.getAttribute("usuario_logado");

        dao.getperfiluser(usuario_logado.getId_usuario());

        model.addAttribute("usuario", usuario_logado);
        return "editarperfil";
    }

    @PostMapping("/editarperf")
    public RedirectView editarperf (@RequestParam int id,@RequestParam String nome, @RequestParam String email, @RequestParam String cpf, @RequestParam String senha, @RequestParam String telefone, @RequestParam Date data_nascimento, HttpSession session){
        Usuario usuario_logado = (Usuario) session.getAttribute("usuario_logado");
        usuario_logado.setId_usuario(id);
        usuario_logado.setNome(nome);
        usuario_logado.setEmail(email);
        usuario_logado.setCpf(cpf);
        usuario_logado.setSenha(senha);
        usuario_logado.setTelefone(telefone);
        usuario_logado.setData_nascimento(data_nascimento);
        dao.editaruser(usuario_logado);

        dao.getperfiluser(usuario_logado.getId_usuario());
        session.setAttribute("usuario_logado", usuario_logado);
        return new RedirectView("/perfil", true);
    }

    @PostMapping("/deletar")
    public RedirectView deletar(@RequestParam int id){
        System.out.println(id);
        dao.deleteUser(id);

        return new RedirectView("/sair", true);
    }


}
