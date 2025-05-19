<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
      <a href="" class="app-brand-link">
        <span class="app-brand-logo demo">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 300 300"
            width="150"
            height="150"
            style="width: 50px ; height: 50px;" 
          >
            <!-- A stylized paper airplane for "Air" -->
            <g fill="#0d6efd">
              <polygon points="50,150 250,50 200,140 150,140 190,210" />
            </g>
            <!-- Trail line (track) -->
            <path d="M 50 150 Q 120 220, 250 250" stroke="#0d6efd" stroke-width="8" fill="none" stroke-linecap="round"/>
          </svg>
        </span>
        <span class="app-brand-text demo menu-text fw-bolder ms-2">AirTrack</span>
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

      <li class="menu-item">
        <a href="/reservation/" class="menu-link">
          <i class="menu-icon tf-icons bx bx-list-ul"></i>
          <div data-i18n="Authentications">Reservations</div>
        </a>
      </li>

      <li class="menu-item">
        <a href="/parametres/" class="menu-link">
          <i class="menu-icon tf-icons bx bx-cog"></i>
          <div data-i18n="Authentications">Parametres</div>
        </a>
      </li>

      <!-- <li class="menu-item">
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
      </li> -->



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