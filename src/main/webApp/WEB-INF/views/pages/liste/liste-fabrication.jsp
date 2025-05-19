<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.Fabrication" %>
<%  
    List<Fabrication> listeFabrication = (List) request.getAttribute("liste");
%>
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"> Liste Fabrication</h4>
    <div class="card">
      <div class="table-responsive text-nowrap">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>Id</th>
              <th>Id produit </th>
              <th>Nom Produit</th>
              <th>Date Fabrication</th>
              <th>Date Peremption</th>
            </tr>
          </thead>
          <tbody class="table-border-bottom-0">
            <% for(Fabrication fab : listeFabrication ){ %>
                <tr>
                  <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%= fab.getId() %></strong></td>
                  <td><%= fab.getProduit().getId() %></td>
                  <td><%= fab.getProduit().getNom()  %></td>
                  <td><%= fab.getDateFabrication() %> </td>
                  <td><%= fab.getDatePeremption() %></td>
                </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </div>
</div>