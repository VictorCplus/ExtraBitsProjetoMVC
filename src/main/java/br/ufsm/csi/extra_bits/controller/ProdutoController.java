package br.ufsm.csi.extra_bits.controller;


import br.ufsm.csi.extra_bits.dao.ProdutoDAO;
import br.ufsm.csi.extra_bits.model.Produto;
import br.ufsm.csi.extra_bits.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class ProdutoController {

        ProdutoDAO dao = new ProdutoDAO();

        @PostMapping("/produto")
        public RedirectView registroProduto(@ModelAttribute("produto")Produto produto){
            dao.cadastroProduto(produto);
            return new RedirectView("/produto", true);
        }

        @PostMapping ("/editarProduto")
        public String editarProduto(@RequestParam int id_produto, Model model){
            model.addAttribute("produto", new ProdutoDAO().getProduto(id_produto));

            return "editarproduto";
        }

        @PostMapping("/editProduto")
        public RedirectView editarProduto(@ModelAttribute("produto") Produto produto){
            dao.editarProduto(produto);

            return new RedirectView("/home", true);
        }

        @PostMapping("/deletarProduto")
        public RedirectView deletarProduto(@RequestParam int id_produto){
            dao.deletarProduto(id_produto);

            return new RedirectView("/home", true);
        }

        @PostMapping("/verProduto")
        public String verProduto(@RequestParam int id_produto, Model model){
            model.addAttribute("produto", new ProdutoDAO().getProduto(id_produto));

            return "visualizarProduto";
        }

}
