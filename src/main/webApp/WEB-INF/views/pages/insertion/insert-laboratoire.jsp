<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<div class="col-md-6">
    <div class="card mb-4">
      <h5 class="card-header">Insertion laboratoire</h5>
      <div class="card-body">
          <form action="/laboratoire/new" method="POST">
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Nom</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Nom laboratoire"
                  name="nom"
                />
              </div>
              <div class="mb-3">
                <label for="lieu" class="form-label">Lieu</label>
                <input
                  class="form-control"
                  type="text"
                  id="lieu"
                  placeholder="C'est quoi le lieu"
                  name="lieu"
                />
              </div>
              <button type="submit" class="btn btn-primary">Valider</button>
          </form>
        
      </div>
    </div>
  </div>