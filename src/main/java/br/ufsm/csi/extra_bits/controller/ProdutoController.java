package br.ufsm.csi.extra_bits.controller;


import br.ufsm.csi.extra_bits.dao.ProdutoDAO;
import br.ufsm.csi.extra_bits.dao.UsuarioDAO;
import br.ufsm.csi.extra_bits.model.CarrinhoCompra;
import br.ufsm.csi.extra_bits.model.Produto;
import br.ufsm.csi.extra_bits.model.Usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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

    @PostMapping("/adicionarAoCarrinho")
    public RedirectView adicionarAoCarrinho(@RequestParam int id_produto, HttpSession session) {
        // Obtenha a lista de IDs de produtos do carrinho da sessão do usuário
        List<Integer> carrinho = (List<Integer>) session.getAttribute("carrinho");

        // Se a lista do carrinho não existir, crie uma nova lista vazia
        if (carrinho == null) {
            carrinho = new ArrayList<>();
        }

        // Adicione o novo ID do produto à lista do carrinho
        carrinho.add(id_produto);

        // Atualize a lista do carrinho na sessão do usuário
        session.setAttribute("carrinho", carrinho);

        // Obtenha a lista de produtos comprados da sessão do usuário
        List<Produto> produtosComprados = (List<Produto>) session.getAttribute("produtosComprados");

        // Se a lista de produtos comprados não existir, crie uma nova lista vazia
        if (produtosComprados == null) {
            produtosComprados = new ArrayList<>();
        }

        // Obtenha o produto correspondente ao ID e adicione à lista de produtos comprados
        Produto produto = dao.getProduto(id_produto);
        produtosComprados.add(produto);

        // Atualize a lista de produtos comprados na sessão do usuário
        session.setAttribute("produtosComprados", produtosComprados);


        // Redirecione o usuário de volta à página inicial após adicionar ao carrinho
        return new RedirectView("/extrabits/home");

    }

    @GetMapping("/carrinho")
    public String mostrarCarrinho(@RequestParam(required = false) Integer id_produto, HttpSession session, Model model) {
        // Obtenha a lista de produtos comprados da sessão do usuário
        List<Produto> produtosComprados = (List<Produto>) session.getAttribute("produtosComprados");

        // Se a lista de produtos comprados não existir, crie uma nova lista vazia
        if (produtosComprados == null) {
            produtosComprados = new ArrayList<>();
        }

        // Verifique se um novo produto foi adicionado ao carrinho (se o id_produto não for nulo)
        if (id_produto != null) {
            Produto produto = dao.getProduto(id_produto);
            produtosComprados.add(produto);
        }
        // Coloque a lista de produtos comprados no modelo para ser usada na página do carrinho
        model.addAttribute("produtosNoCarrinho", produtosComprados);

        // Retorne a página do carrinho para exibir os detalhes dos produtos
        return "carrinho"; // Por exemplo, a página que exibe os detalhes dos produtos no carrinho
    }

    @GetMapping("/remover-do-carrinho")
    public String removerDoCarrinho(@RequestParam(required = true) Integer id_produto, HttpSession session, Model model) {
        // Obtenha a lista de produtos comprados da sessão do usuário
        List<Produto> produtosComprados = (List<Produto>) session.getAttribute("produtosComprados");

        // Verifique se a lista de produtos comprados existe e não está vazia
        if (produtosComprados != null && !produtosComprados.isEmpty()) {
            // Encontre o produto com o ID especificado na lista de produtos comprados
            Produto produtoRemover = null;
            for (Produto produto : produtosComprados) {
                if (produto.getId_produto() == id_produto) {
                    produtoRemover = produto;
                    break;
                }
            }

            // Se o produto foi encontrado, remova-o da lista
            if (produtoRemover != null) {
                produtosComprados.remove(produtoRemover);
            }
        }

        // Atualize a lista de produtos comprados na sessão
        session.setAttribute("produtosComprados", produtosComprados);

        // Coloque a lista de produtos comprados atualizada no modelo para ser usada na página do carrinho
        model.addAttribute("produtosNoCarrinho", produtosComprados);

        // Redirecione para a página do carrinho para exibir a lista atualizada de produtos
        return "redirect:/carrinho";
    }

    @PostMapping("/comprar")
    public String comprarProdutos(HttpSession session, @RequestParam int id_usuario) {
        // Obtenha a lista de produtos comprados da sessão do usuário
        List<Produto> produtosComprados = (List<Produto>) session.getAttribute("produtosComprados");

        // Se a lista de produtos comprados não existir ou estiver vazia, retorne para evitar processamento desnecessário
        if (produtosComprados == null || produtosComprados.isEmpty()) {
            return "redirect:/carrinho"; // Ou outra página adequada para mostrar uma mensagem de carrinho vazio
        }

        // Agora, você pode percorrer a lista de produtos comprados e salvar as informações no banco de dados
        for (Produto produto : produtosComprados) {
            // Crie um objeto representando a compra com os dados do produto e o ID do usuário
            CarrinhoCompra compra = new CarrinhoCompra();
            compra.setId_usuario(id_usuario);
            compra.setId_produto(produto.getId_produto());

            int idpro = produto.getId_produto();
            // Aqui, você pode definir outros campos relevantes, como a quantidade de itens comprados, data da compra, etc.
            // compra.setQuantidadeItens(...);
            // compra.setDataCompra(...);

            // Salve a compra no banco de dados usando o método do DAO apropriado
            dao.comprarProduto(compra); // Substitua "dao" pelo nome da sua instância do DAO
            dao.historicoProduto(produto);
//            dao.deletarProduto(produto.getId_produto());
        }

        // Limpe a lista de produtos comprados na sessão após a compra ser concluída
        produtosComprados.clear();
        session.setAttribute("produtosComprados", produtosComprados);

        // Redirecione o usuário para uma página de confirmação ou de sucesso após a compra
        return "redirect:/carrinho"; // Substitua pelo caminho da página adequada
    }


}
