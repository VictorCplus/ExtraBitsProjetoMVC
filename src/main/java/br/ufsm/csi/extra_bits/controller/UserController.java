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
        Usuario usuario_logado = (Usuario)session.getAttribute("usuario_logado");
        Usuario usuario = null;

        dao.getperfiluser(usuario_logado.getId_usuario());

        model.addAttribute("usuario", usuario);
        return "editarperfil";
    }

    @PostMapping("/deletar")
    public RedirectView deletar(@RequestParam int id){
        dao.deleteuser(id);

        return new RedirectView("/sair", true);
    }


}
