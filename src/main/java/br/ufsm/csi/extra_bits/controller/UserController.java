package br.ufsm.csi.extra_bits.controller;

import br.ufsm.csi.extra_bits.dao.UsuarioDAO;
import br.ufsm.csi.extra_bits.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class UserController {
    UsuarioDAO dao = new UsuarioDAO();


    @PostMapping("/cadastro")
    public RedirectView cadastro(@ModelAttribute("usuario") Usuario usuario){
        dao.cadastroUser(usuario);

        return new RedirectView("/home", true);
    }



}
