<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.Produit" %>
<% 
  List<Produit> listeProduit = (List<Produit>) request.getAttribute("listeProduit");
%>
<div class="col-md-8">
    <div class="card mb-4">
      <h5 class="card-header">Insertion Fabrication</h5>
      <div class="card-body">
        <form action="/fabrication/new" method="POST">
            <div class="mb-3">
              <label for=""class="form-label" >Produit : </label>
              <select class="form-select" name="id_produit">
                <% for(Produit prod: listeProduit){ %>
                  <option value="<%= prod.getId() %>"><%= prod.getNom()  %></option>
                <% } %>
              </select>
            </div>
            <div class="mb-3">
                <label for="age_min" class="form-label">Date Fabrication </label>
                <input
                  type="date"
                  class="form-control"
                  name="date_fabrication"
                />
              </div>

              <div class="mb-3">
                <label for="age_min" class="form-label">Date Peremption </label>
                <input
                  type="date"
                  class="form-control"
                  name="date_peremption"
                />
              </div>

              <div class="mb-3">
                <label for="" class="form-label">PRIX</label>
                <input
                  type="number"
                  class="form-control"
                  name="prix"
                />
              </div>

              <div class="mb-3">
                <label for="" class="form-label">Date prix : </label>
                <input
                  type="date"
                  class="form-control"
                  name="date_prix"
                />
              </div>

              <button type="submit" class="btn btn-primary">Valider</button>
        </form>
      </div>  
    </div>
</div>