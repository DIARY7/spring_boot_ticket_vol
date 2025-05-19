<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<div class="col-md-6">
    <div class="card mb-4">
      <h5 class="card-header">Insertion type produit</h5>
      <div class="card-body">
          <form action="/type-produit/new" method="POST">
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Valeur : </label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Valeur type produit"
                  name="val"
                />
              </div>
              
              <button type="submit" class="btn btn-primary">Valider</button>
          </form>
        
      </div>
    </div>
  </div>