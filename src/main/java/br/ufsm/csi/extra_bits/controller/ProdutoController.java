package br.ufsm.csi.extra_bits.controller;


import br.ufsm.csi.extra_bits.dao.ProdutoDAO;
import br.ufsm.csi.extra_bits.model.CarrinhoCompra;
import br.ufsm.csi.extra_bits.model.Produto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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

            return "editarProduto";
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

    @PostMapping("/adicionarAoCarrinho")
    public RedirectView adicionarAoCarrinho(@RequestParam int id_produto, HttpSession session) {
        // Obtenha a lista de IDs de produtos do carrinho da sessão do usuário
        List<Integer> carrinho = (List<Integer>) session.getAttribute("carrinho");

        if (carrinho == null) {
            carrinho = new ArrayList<>();
        }

        carrinho.add(id_produto);

        session.setAttribute("carrinho", carrinho);

        List<Produto> produtosComprados = (List<Produto>) session.getAttribute("produtosComprados");

        if (produtosComprados == null) {
            produtosComprados = new ArrayList<>();
        }

        Produto produto = dao.getProduto(id_produto);
        produtosComprados.add(produto);

        session.setAttribute("produtosComprados", produtosComprados);


        return new RedirectView("/extrabits/home");

    }

    @GetMapping("/carrinho")
    public String mostrarCarrinho(@RequestParam(required = false) Integer id_produto, HttpSession session, Model model) {

        List<Produto> produtosComprados = (List<Produto>) session.getAttribute("produtosComprados");


        if (produtosComprados == null) {
            produtosComprados = new ArrayList<>();
        }


        if (id_produto != null) {
            Produto produto = dao.getProduto(id_produto);
            produtosComprados.add(produto);
        }
        model.addAttribute("produtosNoCarrinho", produtosComprados);


        return "carrinho";
    }

    @GetMapping("/remover-do-carrinho")
    public String removerDoCarrinho(@RequestParam(required = true) Integer id_produto, HttpSession session, Model model) {
        List<Produto> produtosComprados = (List<Produto>) session.getAttribute("produtosComprados");


        if (produtosComprados != null && !produtosComprados.isEmpty()) {

            Produto produtoRemover = null;
            for (Produto produto : produtosComprados) {
                if (produto.getId_produto() == id_produto) {
                    produtoRemover = produto;
                    break;
                }
            }

            if (produtoRemover != null) {
                produtosComprados.remove(produtoRemover);
            }
        }

        session.setAttribute("produtosComprados", produtosComprados);

        model.addAttribute("produtosNoCarrinho", produtosComprados);


        return "redirect:/carrinho";
    }

    @PostMapping("/comprar")
    public String comprarProdutos(HttpSession session, @RequestParam int id_usuario) {

        List<Produto> produtosComprados = (List<Produto>) session.getAttribute("produtosComprados");


        if (produtosComprados == null || produtosComprados.isEmpty()) {
            return "redirect:/carrinho";
        }


        for (Produto produto : produtosComprados) {

            CarrinhoCompra compra = new CarrinhoCompra();
            compra.setId_usuario(id_usuario);
            compra.setId_produto(produto.getId_produto());


            dao.comprarProduto(compra);
            dao.historicoProduto(produto);
            dao.deletarProduto(produto.getId_produto());
        }


        produtosComprados.clear();
        session.setAttribute("produtosComprados", produtosComprados);

        return "redirect:/carrinho";
    }

    @PostMapping("/pesquisa")
    public String pesquisa(@RequestParam String pesquisa, Model model){
        model.addAttribute("pesquisa", dao.getPesquisa(pesquisa));


            return "resultPesquisa";
    }


}
