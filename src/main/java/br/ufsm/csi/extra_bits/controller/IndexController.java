package br.ufsm.csi.extra_bits.controller;


import br.ufsm.csi.extra_bits.dao.ProdutoDAO;
import br.ufsm.csi.extra_bits.dao.UsuarioDAO;
import br.ufsm.csi.extra_bits.model.Usuario;
import br.ufsm.csi.extra_bits.service.UsuarioService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.util.PriorityQueue;

@Controller
public class IndexController {
    UsuarioDAO userdao = new UsuarioDAO();
    ProdutoDAO pdao = new ProdutoDAO();


    @GetMapping("/")
    public RedirectView barra() {
        return new RedirectView("/home", true);
    }

    @GetMapping("/home")
    public String inicio(Model model, HttpSession session) {
        Usuario usuario_logado = (Usuario)session.getAttribute("usuario_logado");
        model.addAttribute("produtos", pdao.getProdutos());
        return "inicio";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public RedirectView login(@RequestParam String email, String senha, HttpSession session, RedirectAttributes attributes) {
        String url;
        Usuario usuario = new UsuarioService().autenticado(email.toLowerCase(), senha);

        if (usuario != null) {
            session.setAttribute("usuario_logado", usuario);
            url = "/home";
        } else {
            attributes.addFlashAttribute("erro", "Email ou senha incorretos");
            url = "/login";
        }
        return new RedirectView(url, true);
    }


    @GetMapping("/cadastro")
    public String cadastro(){
        return "cadastro";
    }

    @GetMapping("/produto")
    public String produto(){
        return "produto";
    }

    @GetMapping("/sair")
    public RedirectView sair(HttpSession session){
        session.invalidate();
        return new RedirectView("/home",true);
    }



}





