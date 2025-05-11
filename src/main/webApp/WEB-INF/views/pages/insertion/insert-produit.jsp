<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.CategorieProduit" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.Laboratoire" %>
<%@ page import="com.gestionprojet.pharmacie.entity.produit.CategorieAge" %>
<% 
  List<CategorieProduit> listeCategorie = (List<CategorieProduit>) request.getAttribute("listeCategorie");
  List<Laboratoire> listeLabo = (List<Laboratoire>) request.getAttribute("listeLabo");
  List<CategorieAge> listeCategorieAge = (List<CategorieAge>) request.getAttribute("listeCategorieAge");
%>
<div class="col-md-8">
    <div class="card mb-4">
      <h5 class="card-header">Insertion produit</h5>
      <div class="card-body">
          <form action="/produit/new" method="POST">
              <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Nom du produit </label>
                    <input
                    type="text"
                    class="form-control"
                    placeholder="Nom du produit"
                    name="nom"
                    />
              </div>
              <div class="mb-3">
                <label class="form-label" for="basic-icon-default-message">Description</label>
                <div class="input-group input-group-merge">
                <span id="basic-icon-default-message2" class="input-group-text"
                    ><i class="bx bx-comment"></i
                ></span>
                <textarea
                    class="form-control"
                    placeholder="Donner la description du produit "
                    name="description"
                    ></textarea>
                </div>
              </div>
              <div class="mb-3">
                <label  class="form-label">Categorie Age : </label>
                <select class="form-select" name="id_categorie_age" id="exampleFormControlSelect1" aria-label="Default select example" >
                  <% for( CategorieAge catAge :  listeCategorieAge){ %>
                      <option value="<%= catAge.getId() %>"><%= catAge.getVal() %></option>
                  <% } %>
                </select>
              </div>
              <div class="mb-3">
                <label  class="form-label">Categorie : </label>
                <select class="form-select" name="id_categorie_produit" id="exampleFormControlSelect1" aria-label="Default select example" >
                  <% for( CategorieProduit catProd :  listeCategorie){ %>
                      <option value="<%= catProd.getId() %>"><%= catProd.getVal() %></option>
                  <% } %>
                  
                </select>
              </div>
              <div class="mb-3">
                <label  class="form-label">Laboratoire : </label>
                <select class="form-select" name="id_labo" id="exampleFormControlSelect1" aria-label="Default select example" >
                  <% for( Laboratoire labo :  listeLabo){ %>
                      <option value="<%= labo.getId() %>"><%= labo.getNom() %></option>
                  <% } %>
                  
                </select>
              </div>

              <button type="submit" class="btn btn-primary">Valider</button>
          </form>
      </div>
    </div>
  </div>