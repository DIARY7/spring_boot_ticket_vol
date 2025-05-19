<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gestionprojet.pharmacie.entity.vente.Vente" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.CategorieProduit" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.CategorieAge" %>
<%  
    List<Vente> listeVentes = (List) request.getAttribute("liste");
    List<CategorieAge> listeCatAge = (List) request.getAttribute("listeCatAge");
    List<CategorieProduit> listeCatProd = (List) request.getAttribute("listeCatProd"); 
%>
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"> Liste ventes</h4>
    <div class="container row" >
      <form action="/vente/filtre" method="get">
        <div class="mb-3">
          <label for="form-label">Categorie Produit</label>
          <select class="form-select" name="id_categorie_produit" id="">
            <% for( CategorieProduit catProd : listeCatProd ){ %>
              <option value="<%= catProd.getId() %>"><%= catProd.getVal() %></option>
            <% } %>
          </select>
        </div>
        <div class="mb-2"></div>
        <div class="mb-2">
          <label for="form-label">Categorie age</label>
          <select class="form-select" name="id_categorie_age" id="">
            <% for( CategorieAge catAge : listeCatAge){ %>
              <option value="<%= catAge.getId() %>"><%= catAge.getVal() %></option>
            <% } %>
              
          </select>
        </div>
        <div class="mb3" style="margin-bottom:20px;">
          <button class="btn btn-primary">Search</button>

        </div>
      </form>
    </div>
    <div class="card">
      <div class="table-responsive text-nowrap">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>Id</th>
              <th>Nombre</th>
              <th>Date</th>
              <th>Produit</th>
              <th>Client</th>
            </tr>
          </thead>
          <tbody class="table-border-bottom-0">
            <% 
                for(Vente vente:listeVentes){ %>
                    <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%= vente.getId() %></strong></td>
                        <td><%= vente.getNombre() %></td>
                        <td><%= vente.getDaty() %></td>
                        <td><%= vente.getLivraison().getFabrication().getProduit().getNom() %></td>
                        <td> <%= vente.getClient().getNom() %> </td>
                    </tr>
            <%    }
            %>
            </tbody>
        </table>
      </div>
    </div>
</div>