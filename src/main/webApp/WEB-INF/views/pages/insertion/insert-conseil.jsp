<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.Produit" %>
<% 
  List<Produit> listeProduit = (List<Produit>) request.getAttribute("liste_produit");
%>
<div class="col-md-8">
    <div class="card mb-4">
      <h5 class="card-header">Insertion Conseil</h5>
      <div class="card-body">
        <form action="/produit_conseil/new" method="POST">
            <div class="mb-3">
              <label for=""class="form-label" >Produit : </label>
              <select class="form-select" name="id_produit">
                <% for(Produit prod: listeProduit){ %>
                  <option value="<%= prod.getId() %>"><%= prod.getNom()  %></option>
                <% } %>
              </select>
            </div>
            <div class="mb-3">
                <label for="age_min" class="form-label">Mois </label>
                <select class="form-select" name="mois" id="">
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

              <div class="mb-3">
                <label for="age_min" class="form-label">Annee </label>
                <input
                  type="number"
                  class="form-control"
                  name="annee"
                  value="2025"

                />
              </div>
              <button type="submit" class="btn btn-primary">Valider</button>
        </form>
      </div>  
    </div>
</div>