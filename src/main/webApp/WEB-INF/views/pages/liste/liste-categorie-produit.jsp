<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.CategorieProduit" %>
<%  
    List<CategorieProduit> listeCat = (List) request.getAttribute("liste");
%>
<div class="container-xxl flex-grow-1 container-p-y">
    <h4 class="fw-bold py-3 mb-4"> Liste Categorie Produits</h4>
    <div class="card">
      <div class="table-responsive text-nowrap">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>Id</th>
              <th>Val</th>
              <th>Type produit </th>
            </tr>
          </thead>
          <tbody class="table-border-bottom-0">
            <% 
                for(CategorieProduit catProd:listeCat){ %>
                    <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong><%= catProd.getId() %></strong></td>
                        <td><%= catProd.getVal() %></td>
                        <td><%= catProd.getTypeProduit().getVal() %></td>
                    </tr>
            <%    }
            %>
            </tbody>
        </table>
      </div>
    </div>
</div>