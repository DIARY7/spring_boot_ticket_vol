<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.spring_boot_ticket_vol.entity.Reservation" %>
<%  
    List<Reservation> listeReservation = (List) request.getAttribute("liste");
%>
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"> Liste Reservations</h4>
    <div class="card">
      <div class="table-responsive text-nowrap">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>Vol</th>
              <th>Utilisateur</th>
              <th>Effectifs</th>
              <th>Type de siège</th>
              <th>Places</th>
              <th>Prix total</th>
            </tr>
          </thead>
          <tbody class="table-border-bottom-0">
            <% 
                for(Reservation reservation : listeReservation ){ %>
                    <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%= reservation.getPlaceVol().getVol().getId() %></strong></td>
                        <td><%= reservation.getUtilisateur().getNom() %></td>
                        <td><div class="flex flex-col">
                              <span>
                                  <%= reservation.getNbAdulte()
                                      %> adulte(s)
                              </span>
                              <% if (reservation.getNbEnfant()>
                                  0) { %>
                                  <span>
                                      <%= reservation.getNbEnfant()
                                          %> enfant(s)
                                  </span>
                                  <% } %>
                          </div></td>
                        <td><%= reservation.getPlaceVol().getPlace().getTypeSiege().getDesignation() %></td>
                        <td><%= reservation.getNbPlaces() %></td>
                        <td><%= reservation.getPrix() %></td>
                    </tr>
            <%    }
            %>
            </tbody>
        </table>
      </div>
    </div>
</div>