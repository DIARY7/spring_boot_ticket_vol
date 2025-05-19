<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.Laboratoire" %>
<%  
    List<Laboratoire> listeLaboratoire = (List) request.getAttribute("liste");
%>
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"> Liste laboratoire</h4>
    <div class="card">
      <div class="table-responsive text-nowrap">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>Id</th>
              <th>Nom</th>
              <th>Lieu</th>
            </tr>
          </thead>
          <tbody class="table-border-bottom-0">
            <% for(Laboratoire lab : listeLaboratoire ){ %>
                <tr>
                  <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%= lab.getId() %></strong></td>
                  <td><%= lab.getNom() %></td>
                  <td><%= lab.getLieu()  %></td>
                </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </div>
</div>