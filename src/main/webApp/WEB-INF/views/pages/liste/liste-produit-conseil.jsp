<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.Produit" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.CategorieAge" %>
<%  
    List<Produit> listeProduits = (List) request.getAttribute("liste");
    Integer annee =(Integer)request.getAttribute("annee");
     
%>
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"> Liste produits conseils </h4>
    <div class="container row" >
      <form action="/produit_conseil/filtre" method="get">
        <div class="mb-2">
          <label for="mois-label">Mois</label>
          <select class="form-select" name="mois" id="">
            <option value="0">all</option>
            <option value="1">Janvier</option>
            <option value="2">Fevrier</option>
            <option value="3">Mars</option>
            <option value="4">Avril</option>
            <option value="5">Mai</option>
            <option value="6">Juin</option>
            <option value="7">Juillet</option>
            <option value="8">Aout</option>
            <option value="9">Septembre</option>
            <option value="10">Octobre</option>
            <option value="11">Novembre</option>
            <option value="12">Decembre</option>
            
        </select>
        </div>
        <div class="mb-2"></div>
        <div class="mb-2">
          <label for="form-label">Annee</label>
          <input type="number" class="form-control" value="<% if(annee!=null) out.print(annee); else out.print(2025); %>" name="annee" id="annee-label">
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
              <th>Nom</th>
              <th>Categorie</th>
              <th>Description</th>
            </tr>
          </thead>
          <tbody class="table-border-bottom-0">
            <% 
                for(Produit prod:listeProduits){ %>
                    <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%= prod.getId() %></strong></td>
                        <td><%= prod.getNom() %></td>
                        <td><%= prod.getCategorieProduit().getVal() %></td>
                        <td><%= prod.getDescription() %></td>
                    </tr>
            <%    }
            %>
            </tbody>
        </table>
      </div>
    </div>
</div>