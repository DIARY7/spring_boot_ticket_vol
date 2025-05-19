<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<% if (request.getAttribute("successMessage") != null) { %>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
    <i class="bi bi-check-circle-fill me-2"></i>
    <%= request.getAttribute("successMessage") %>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
<% } else if (request.getAttribute("errorMessage") != null) { %>
  <div class="alert alert-danger alert-dismissible fade show" role="alert">
    <i class="bi bi-exclamation-triangle-fill me-2"></i>
    <%= request.getAttribute("errorMessage") %>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
<% } %>

<div class="col-md-10">
  <div class="card mb-4">
    <h5 class="card-header">Mise à jour paramètres</h5>
    <div class="card-body">
       
      <div class="row">
        <!-- Formulaire Délai de réservation -->
        <div class="col-md-6 mb-4">
          <div class="border p-3 rounded shadow-sm">
            <form action="/parametres/update/delai_reservation" method="post">
              <label for="delaiReservation" class="form-label">
                <i class="bi bi-clock-history me-1"></i>
                Délai minimum de réservation <span class="text-danger">*</span>
              </label>
              <div class="input-group mb-2">
                <input
                  type="number"
                  class="form-control"
                  name="valeur"
                  id="delaiReservation"
                  value="<%= request.getAttribute("delaiReservation") %>"
                  min="0"
                  required
                />
                <span class="input-group-text">heures</span>
              </div>
              <div class="form-text mb-2">
                <i class="bi bi-info-circle me-1"></i>
                Délai minimum requis avant le départ pour effectuer une réservation
              </div>
              <button type="submit" class="btn btn-primary">
                <i class="bi bi-check-circle me-1"></i>
                Appliquer
              </button>
            </form>
          </div>
        </div>

        <!-- Formulaire Délai d'annulation -->
        <div class="col-md-6 mb-4">
          <div class="border p-3 rounded shadow-sm">
            <form action="/parametres/update/delai_annulation" method="post">
              <label for="delaiAnnulation" class="form-label">
                <i class="bi bi-x-circle me-1"></i>
                Délai minimum d'annulation <span class="text-danger">*</span>
              </label>
              <div class="input-group mb-2">
                <input
                  type="number"
                  class="form-control"
                  name="valeur"
                  id="delaiAnnulation"
                  value="<%= request.getAttribute("delaiAnnulation") %>"
                  min="0"
                  required
                />
                <span class="input-group-text">heures</span>
              </div>
              <div class="form-text mb-2">
                <i class="bi bi-info-circle me-1"></i>
                Délai minimum requis avant le départ pour annuler une réservation
              </div>
              <button type="submit" class="btn btn-primary">
                <i class="bi bi-check-circle me-1"></i>
                Appliquer
              </button>
            </form>
          </div>
        </div>
      </div>

      <!-- Formulaire Réduction enfant -->
      <div class="row">
        <div class="col-md-6 mb-4">
          <div class="border p-3 rounded shadow-sm">
            <form action="/parametres/update/reduc_enfant" method="post">
              <label for="reductionEnfant" class="form-label">
                <i class="bi bi-percent me-1"></i>
                Réduction pour les enfants <span class="text-danger">*</span>
              </label>
              <div class="input-group mb-2">
                <input
                  type="number"
                  class="form-control"
                  name="valeur"
                  id="reductionEnfant"
                  value="<%= request.getAttribute("reductionEnfant") %>"
                  min="0"
                  max="100"
                  required
                />
                <span class="input-group-text">%</span>
              </div>
              <div class="form-text mb-2">
                <i class="bi bi-info-circle me-1"></i>
                Pourcentage de réduction appliqué aux billets enfants
              </div>
              <button type="submit" class="btn btn-primary">
                <i class="bi bi-check-circle me-1"></i>
                Appliquer
              </button>
            </form>
          </div>
        </div>
      </div>

      <div class="alert alert-info mt-3">
        <i class="bi bi-info-circle-fill me-2"></i>
        <strong>Note :</strong> Chaque paramètre est modifiable individuellement.
      </div>
    </div>
  </div>
</div>
