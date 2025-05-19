<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<div class="col-md-8">
    <div class="card mb-4">
        <h5 class="card-header">Configuration du système</h5>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/admin/parametres/update" method="post">
                
                <div class="mb-3">
                    <label for="delaiReservation" class="form-label">
                        Délai minimum de réservation <span class="text-danger">*</span>
                    </label>
                    <div class="input-group">
                        <input type="number" class="form-control" name="delaiReservation" id="delaiReservation"
                            value="<%= request.getAttribute("delaiReservation") %>" min="0" step="0.5" required>
                        <span class="input-group-text">heures</span>
                    </div>
                    <div class="form-text">
                        Délai minimum requis avant le départ pour effectuer une réservation
                    </div>
                </div>

                <div class="mb-3">
                    <label for="delaiAnnulation" class="form-label">
                        Délai minimum d'annulation <span class="text-danger">*</span>
                    </label>
                    <div class="input-group">
                        <input type="number" class="form-control" name="delaiAnnulation" id="delaiAnnulation"
                            value="<%= request.getAttribute("delaiAnnulation") %>" min="0" step="0.5" required>
                        <span class="input-group-text">heures</span>
                    </div>
                    <div class="form-text">
                        Délai minimum requis avant le départ pour annuler une réservation
                    </div>
                </div>

                <div class="mb-3">
                    <label for="reductionEnfant" class="form-label">
                        Réduction pour les enfants <span class="text-danger">*</span>
                    </label>
                    <div class="input-group">
                        <input type="number" class="form-control" name="reductionEnfant" id="reductionEnfant"
                            value="<%= request.getAttribute("reductionEnfant") %>" min="0" max="100" step="0.5" required>
                        <span class="input-group-text">%</span>
                    </div>
                    <div class="form-text">
                        Pourcentage de réduction appliqué aux billets enfants
                    </div>
                </div>

                <div class="alert alert-info mt-4">
                    <strong>Note:</strong> Ces paramètres affectent les conditions de réservation et d'annulation pour tous les vols.
                    Assurez-vous de définir des valeurs appropriées pour votre activité.
                </div>

                <button type="submit" class="btn btn-primary mt-3">
                    Enregistrer les modifications
                </button>
            </form>
        </div>
    </div>
</div>
