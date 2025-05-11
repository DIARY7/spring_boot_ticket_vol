<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.gestionprojet.pharmacie.entity.vente.Vente" %>
<%@ page import="com.gestionprojet.pharmacie.dto.CommissionDto" %>
<%@ page import="com.gestionprojet.pharmacie.entity.vente.Sexe" %>

<%  
    List<CommissionDto> listeCommission = (List) request.getAttribute("liste");
    LocalDate date_avant =(LocalDate)request.getAttribute("date_avant");    
    LocalDate date_apres =(LocalDate)request.getAttribute("date_apres");
    List<Sexe> listeSexe = (List) request.getAttribute("listeSexe");
    List <CommissionDto> listeHomme = (List) request.getAttribute("listeHomme");
    List <CommissionDto> listeFemme = (List) request.getAttribute("listeFemme");
%>
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"> Liste Commission vendeur </h4>
    <div class="container row" >
      <form action="/vendeur_commission/filtre" method="get">
        <div class="mb-3">
          <label for="form-label">Date Min : </label>
          <input type="date" class="form-control" name="date_avant" id="" value="<% if(date_avant!=null) out.print(date_avant); else out.print(LocalDate.now()); %>">
        </div>

        <div class="mb-3">
            <label for="form-label">Date Max : </label>
            <input type="date" class="form-control" name="date_apres" id="" value="<% if(date_apres!=null) out.print(date_apres); else out.print(LocalDate.now()); %>">
          </div>

          <div class="mb-3">
            <label for="form-label">Sexe vendeur</label>
            <select class="form-select" name="id_sexe" id="">
              <option value="-1">All</option>
              <% for( Sexe sexy : listeSexe ){ %>
                <option value="<%= sexy.getId() %>"><%= sexy.getValeur() %></option>
              <% } %>
            </select>
          </div>

        <div class="mb3" style="margin-bottom:20px;">
          <button class="btn btn-primary">Search</button>

        </div>
      </form>
    </div>
    <% if(listeCommission!=null){ %>
      <div class="card">
        <div class="table-responsive text-nowrap">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Id Vendeur</th>
                <th>Nom Vendeur</th>
                <th>Commission</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0">
              <% 
                  for(CommissionDto comDto: listeCommission){ %>
                      <tr>
                          <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%=comDto.getId() %></strong></td>
                          <td><%= comDto.getNom() %></td>
                          <td><%= comDto.getTotal() %></td>
                      </tr>
              <%    }
              %>
              </tr>
              <tr>
                <th style="text-align: center;font-size: 22px;" >Total</th>
                <th colspan="3" style="text-align: center;font-size: 22px;" > <%= CommissionDto.getTotalCommission(listeCommission) %></th>
              </tr>
              </tbody>
          </table>
        </div>
      </div>
    <% } else{ %>
      <h4 class="fw-bold mb-4"> Commission Homme </h4>
      <div class="card" style="margin-bottom: 42px ;" >
        <div class="table-responsive text-nowrap">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Id Vendeur</th>
                <th>Nom Vendeur</th>
                <th>Commission</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0">
              <% 
                  for(CommissionDto comDto: listeHomme){ %>
                      <tr>
                          <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%=comDto.getId() %></strong></td>
                          <td><%= comDto.getNom() %></td>
                          <td><%= comDto.getTotal() %></td>
                      </tr>
              <%    }
              %>
              </tr>
              <tr>
                <th style="text-align: center;font-size: 22px;" >Total</th>
                <th colspan="3" style="text-align: center;font-size: 22px;" > <%= CommissionDto.getTotalCommission(listeHomme) %></th>
              </tr>
              </tbody>
          </table>
        </div>
      </div>

      <h4 class="fw-bold mb-4"> Commission Femme </h4>
      <div class="card">
        <div class="table-responsive text-nowrap">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Id Vendeur</th>
                <th>Nom Vendeur</th>
                <th>Commission</th>
              </tr>
            </thead>
            <tbody class="table-border-bottom-0">
              <% 
                  for(CommissionDto comDto: listeFemme){ %>
                      <tr>
                          <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%=comDto.getId() %></strong></td>
                          <td><%= comDto.getNom() %></td>
                          <td><%= comDto.getTotal() %></td>
                      </tr>
              <%    }
              %>
              </tr>
              <tr>
                <th style="text-align: center;font-size: 22px;" >Total</th>
                <th colspan="3" style="text-align: center;font-size: 22px;" > <%= CommissionDto.getTotalCommission(listeFemme) %></th>
              </tr>
              </tbody>
          </table>
        </div>
      </div>

    <% } %>
    
</div>