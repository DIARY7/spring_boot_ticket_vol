<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.TypeProduit" %>
<% 
  List<TypeProduit> listeTypeProduit = (List<TypeProduit>) request.getAttribute("listeTypeProduit");
%>
<div class="col-md-6">
    <div class="card mb-4">
      <h5 class="card-header">Insertion Categorie Produit</h5>
      <div class="card-body">
            <form action="/categorie-produit/new" method="POST">
                
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Nom : </label>
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Valeur categorie"
                      name="val"
                    />
                  </div>

                  <div class="mb-3">
                    <label  class="form-label">Type produit : </label>
                    <select name="id_type_produit" class="form-select" id="exampleFormControlSelect1" aria-label="Default select example">
                    <% for(TypeProduit tp : listeTypeProduit ){ %>
                        <option value="<%= tp.getId() %>"><%=  tp.getVal() %></option>
                    <% } %>
                    </select>
                  </div>    
                  <button type="submit" class="btn btn-primary">Valider</button> 
            </form>
        
        </div>
    </div>
  </div>