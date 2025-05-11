<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.Fabrication" %>
<%@ page import="com.gestionprojet.pharmacie.entity.vente.Client" %>
<%@ page import="com.gestionprojet.pharmacie.entity.vente.Vendeur" %>
<% 
  List<Fabrication> listeFabrication = (List<Fabrication>) request.getAttribute("listeFabrication");
  List<Client> listeClient = (List<Client>) request.getAttribute("listeClient");
  List<Vendeur> listeVendeur = (List<Vendeur>) request.getAttribute("listeVendeur");
%>

<div class="col-md-8">
    <div class="card mb-4">
      <h5 class="card-header">Insertion Vente</h5>
      <div class="card-body">
        <form action="/vente/new" method="POST">
            <div class="mb-3">
              <label for=""class="form-label" >Produit : </label>
              <select class="form-select" name="id_fabrication">
                <% for(Fabrication fab: listeFabrication){ %>
                  <option value="<%= fab.getId() %>"><%= fab.getProduit().getNom()  %> </option>
                <% } %>
              </select>
            </div>
            <div class="mb-3">
                <label for="" class="form-label">Nombre </label>
                <input
                  type="number"
                  class="form-control"
                  name="nombre"
                />
              </div>

              
              <div class="mb-3">
                <label for=""class="form-label" >Vendeur : </label>
                <select class="form-select" name="id_vendeur">
                  <% for(Vendeur vd: listeVendeur ){ %>
                    <option value="<%= vd.getId() %>"><%= vd.getNom()  %></option>
                  <% } %>
                </select>
              </div>

              <div class="mb-3">
                <label for="age_min" class="form-label">Date  </label>
                <input
                  type="date"
                  class="form-control"
                  name="daty"
                />
              </div>

              <div class="mb-3">
                <label for=""class="form-label" >Client : </label>
                <select class="form-select" name="id_client">
                  <% for(Client clt: listeClient){ %>
                    <option value="<%= clt.getId() %>"><%= clt.getNom()  %></option>
                  <% } %>
                </select>
              </div>

              <button type="submit" class="btn btn-primary">Valider</button>
        </form>
      </div>  
    </div>
</div>