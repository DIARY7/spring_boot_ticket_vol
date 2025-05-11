<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.gestionprojet.pharmacie.entity.vente.Vente" %>

<%  
    List<Vente> listeVentes = (List) request.getAttribute("liste");
    LocalDate daty =(LocalDate)request.getAttribute("daty");
%>
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"> Liste Clients</h4>
    <div class="container row" >
      <form action="/client/filtre" method="get">
        <div class="mb-3">
          <label for="form-label">Date vente</label>
          <input type="date" class="form-control" name="date" id="" value="<% if(daty!=null) out.print(daty); else out.print(LocalDate.now()); %>">
        </div>
        <div class="mb3" style="margin-bottom:20px;">
          <button class="btn btn-primary">Search</button>

        </div>
      </form>
    </div>
    <% if (listeVentes.size()==0 && daty!=null) { %> 
    <h1>
    Aucun client n'a acheter a la date   <%= daty %>
    </h1>
    <% }else { %> 
    <div class="card">
      <div class="table-responsive text-nowrap">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>Id Client</th>
              <th> Nom Client</th>
              <th>Nombre</th>
              <th>Date</th>
              <th>Produit</th>
            </tr>
          </thead>
          <tbody class="table-border-bottom-0">
            <% 
                for(Vente vente:listeVentes){ %>
                    <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%= vente.getClient().getId() %></strong></td>
                        <td> <%= vente.getClient().getNom() %> </td>
                        <td><%= vente.getNombre() %></td>
                        <td><%= vente.getDaty() %></td>
                        <td><%= vente.getFabrication().getProduit().getNom() %></td>
                    </tr>
            <%    }
            %>
            </tbody>
        </table>
      </div>
    <% } %>
    </div>
</div>