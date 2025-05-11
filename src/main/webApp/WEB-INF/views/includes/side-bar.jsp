<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
      <a href="" class="app-brand-link">
        <span class="app-brand-logo demo">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 300 300"
            width="100"
            height="100"
          >
            <g fill="#00FF00">
              <!-- Rectangle central vertical -->
              <rect x="140" y="40" width="80" height="280" />
              <!-- Rectangle central horizontal -->
              <rect x="40" y="140" width="280" height="80" />
            </g>
          </svg>
        </span>
        <span class="app-brand-text demo menu-text fw-bolder ms-2">PHARMACIE</span>
      </a>
      <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
        <i class="bx bx-chevron-left bx-sm align-middle"></i>
      </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
      <!-- Dashboard -->
      <!-- <li class="menu-item">
        <a href="index.html" class="menu-link">
          <i class="menu-icon tf-icons bx bx-home-circle"></i>
          <div data-i18n="Analytics">Dashboard</div>
        </a>
      </li> -->

      <li class="menu-header small text-uppercase">
        <span class="menu-header-text">CRUD</span>
      </li>
      
      <li class="menu-item">
        <a href="javascript:void(0);" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
          <div data-i18n="Authentications">Reservation</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item">
            <a href="/produit/form" class="menu-link">
              <div data-i18n="Basic">Liste</div>
            </a>
          </li>
        </ul>
      </li>

      <li class="menu-item">
        <a href="javascript:void(0);" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-collection"></i>
          <div data-i18n="Authentications">Listes</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item">
            <a href="/produit" class="menu-link">
              <div data-i18n="Basic">Produit</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/laboratoire" class="menu-link">
              <div data-i18n="Basic">Laboratoire</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/categorie-produit" class="menu-link">
              <div data-i18n="Basic">Categorie Produit</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/type-produit" class="menu-link">
              <div data-i18n="Basic">Type Produit</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="/fabrication" class="menu-link">
              <div data-i18n="Basic">Fabrication</div>
            </a>
          </li>

          <li class="menu-item">
            <a href="/livraison" class="menu-link">
              <div data-i18n="Basic">Livraison</div>
            </a>
          </li>

        </ul>
      </li>

      <li class="menu-header small text-uppercase">
        <span class="menu-header-text">Vente</span>
      </li>

      <li class="menu-item">
        <a href="javascript:void(0);" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-collection"></i>
          <div data-i18n="Authentications">Ventes</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item">
            <a href="/vente" class="menu-link">
              <div data-i18n="Basic">Liste</div>
            </a>
          </li>

          <li class="menu-item">
            <a href="/vente/form" class="menu-link">
              <div data-i18n="Basic">insertion</div>
            </a>
          </li>

          <li class="menu-item">
            <a href="/vendeur_commission" class="menu-link">
              <div data-i18n="Basic">Vendeur-commission</div>
            </a>
          </li>
        </ul>

        <ul class="menu-sub">
          <li class="menu-item">
            <a href="/client" class="menu-link">
              <div data-i18n="Basic">Client</div>
            </a>
          </li>
        </ul>
        
        <li class="menu-header small text-uppercase">
          <span class="menu-header-text">Conseil</span>
        </li>
  
        <li class="menu-item">
          <a href="javascript:void(0);" class="menu-link menu-toggle">
            <i class="menu-icon tf-icons bx bx-collection"></i>
            <div data-i18n="Authentications">Conseil</div>
          </a>
          <ul class="menu-sub">
            <li class="menu-item">
              <a href="/produit_conseil" class="menu-link">
                <div data-i18n="Basic">Liste</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="/produit_conseil/form" class="menu-link">
                <div data-i18n="Basic">insertion</div>
              </a>
            </li>
          </ul>




      </ul>

      <!-- <li class="menu-item">
        <a href="javascript:void(0);" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bx-cube-alt"></i>
          <div data-i18n="Misc">Misc</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item">
            <a href="pages-misc-error.html" class="menu-link">
              <div data-i18n="Error">Error</div>
            </a>
          </li>
          <li class="menu-item">
            <a href="pages-misc-under-maintenance.html" class="menu-link">
              <div data-i18n="Under Maintenance">Under Maintenance</div>
            </a>
          </li>
        </ul>
      </li> -->
    </ul>
  </aside>

  <!-- liste des icones
  -menu-icon tf-icons bx bx-layout
  -menu-icon tf-icons bx bx-dock-top
  -menu-icon tf-icons bx bx-lock-open-alt
  -menu-icon tf-icons bx bx-cube-alt
  -menu-icon tf-icons bx bx-collection
  -menu-icon tf-icons bx bx-box
  -menu-icon tf-icons bx bx-copy
  -menu-icon tf-icons bx bx-crown
  -menu-icon tf-icons bx bx-detail -->