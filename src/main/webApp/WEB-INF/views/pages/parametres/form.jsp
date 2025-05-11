<div class="col-md-10">
  <div class="card mb-4">
    <h5 class="card-header">Mise à jour paramètres</h5>
    <div class="card-body">
      <form action="/admin/parametres/update" method="post">
        <div class="mb-3">
          <label for="delaiReservation" class="form-label">
            <i class="bi bi-clock-history me-1"></i>
            Délai minimum de réservation <span class="text-danger">*</span>
          </label>
          <div class="input-group">
            <input
              type="number"
              class="form-control"
              name="delaiReservation"
              id="delaiReservation"
              value="<%= request.getAttribute("delaiReservation") %>"
              min="0"
              step="0.5"
              required
            />
            <span class="input-group-text">heures</span>
          </div>
          <div class="form-text">
            <i class="bi bi-info-circle me-1"></i>
            Délai minimum requis avant le départ pour effectuer une réservation
          </div>
        </div>

        <div class="mb-3">
          <label for="delaiAnnulation" class="form-label">
            <i class="bi bi-x-circle me-1"></i>
            Délai minimum d'annulation <span class="text-danger">*</span>
          </label>
          <div class="input-group">
            <input
              type="number"
              class="form-control"
              name="delaiAnnulation"
              id="delaiAnnulation"
              value="<%= request.getAttribute("delaiAnnulation") %>"
              min="0"
              step="0.5"
              required
            />
            <span class="input-group-text">heures</span>
          </div>
          <div class="form-text">
            <i class="bi bi-info-circle me-1"></i>
            Délai minimum requis avant le départ pour annuler une réservation
          </div>
        </div>

        <div class="mb-3">
          <label for="reductionEnfant" class="form-label">
            <i class="bi bi-percent me-1"></i>
            Réduction pour les enfants <span class="text-danger">*</span>
          </label>
          <div class="input-group">
            <input
              type="number"
              class="form-control"
              name="reductionEnfant"
              id="reductionEnfant"
              value="<%= request.getAttribute("reductionEnfant") %>"
              min="0"
              max="100"
              step="0.5"
              required
            />
            <span class="input-group-text">%</span>
          </div>
          <div class="form-text">
            <i class="bi bi-info-circle me-1"></i>
            Pourcentage de réduction appliqué aux billets enfants
          </div>
        </div>

        <div class="alert alert-info mt-4">
          <i class="bi bi-info-circle-fill me-2"></i>
          <strong>Note :</strong> Ces paramètres affectent les conditions de réservation et d'annulation pour tous les vols. Assurez-vous de définir des valeurs appropriées pour votre activité.
        </div>

        <div class="d-flex gap-2 mt-4">
          <button type="submit" class="btn btn-primary">
            <i class="bi bi-check-circle me-1"></i>
            Enregistrer les modifications
          </button>
          <a href="${pageContext.request.contextPath}/admin" class="btn btn-secondary">
            <i class="bi bi-x-circle me-1"></i>
            Annuler
          </a>
        </div>
      </form>
    </div>
  </div>
</div>
