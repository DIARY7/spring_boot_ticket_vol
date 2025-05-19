<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.Fabrication" %>
<% 
  List<Fabrication> listeFabrication = (List<Fabrication>) request.getAttribute("listeFabrication");
%>
<div class="col-md-8">
    <div class="card mb-4">
      <h5 class="card-header">Insertion prix</h5>
      <div class="card-body">
        <form action="/livraison/new" method="POST">
            <div class="mb-3">
              <label for=""class="form-label" >Fabrication : </label>
              <select class="form-select" name="id_fabrication">
                <% for(Fabrication fab: listeFabrication){ %>
                  <option value="<%= fab.getId() %>"><%= fab.getProduit().getNom()  %></option>
                <% } %>
              </select>
            </div>
            <div class="mb-3">
                <label for="daty" class="form-label">Date de modification </label>
                <input
                  type="date"
                  class="form-control"
                  name="daty"
                />
              </div>

              <div class="mb-3">
                <label for="" class="form-label">PRIX</label>
                <input
                  type="number"
                  class="form-control"
                  name="prix_unitaire"
                />
              </div>

              <button type="submit" class="btn btn-primary">Valider</button>
        </form>
      </div>  
    </div>
</div>