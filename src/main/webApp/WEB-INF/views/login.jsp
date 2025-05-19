<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<% String error = (String) request.getAttribute("loginError"); %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire de Connexion Animé</title>
    <link rel="stylesheet" href="/assets/css/login.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
</head>
<body>
    <div class="container">
        <div class="form-container">
            <div class="form-header">
                <h1>Connexion</h1>
                <p>Bienvenue ! Veuillez vous connecter pour continuer.</p>
            </div>
            
            <form id="login-form" method="post" action="/login" <% if(error!=null){ %> style="animation: animeshake 1s cubic-bezier(.36,.07,.19,.97) both;" <% } %> >
                <div class="input-group">
                    <input type="text" id="email" name="pseudo" value="jdupont" required>
                    <label for="email">Pseudo</label>
                    <div class="line"></div>
                    <div class="error-message" id="email-error"></div>
                </div>
                
                <div class="input-group">
                    <input type="password" id="password" required value="password123" name="motDePasse">
                    <label for="password" >Mot de passe</label>
                    <div class="line"></div>
                    <button type="button" id="toggle-password" class="toggle-password">
                        <svg class="eye-open" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                            <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                        </svg>
                        <svg class="eye-closed" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                            <path d="M12 7c2.76 0 5 2.24 5 5 0 .65-.13 1.26-.36 1.83l2.92 2.92c1.51-1.26 2.7-2.89 3.43-4.75-1.73-4.39-6-7.5-11-7.5-1.4 0-2.74.25-3.98.7l2.16 2.16C10.74 7.13 11.35 7 12 7zM2 4.27l2.28 2.28.46.46C3.08 8.3 1.78 10.02 1 12c1.73 4.39 6 7.5 11 7.5 1.55 0 3.03-.3 4.38-.84l.42.42L19.73 22 21 20.73 3.27 3 2 4.27zM7.53 9.8l1.55 1.55c-.05.21-.08.43-.08.65 0 1.66 1.34 3 3 3 .22 0 .44-.03.65-.08l1.55 1.55c-.67.33-1.41.53-2.2.53-2.76 0-5-2.24-5-5 0-.79.2-1.53.53-2.2zm4.31-.78l3.15 3.15.02-.16c0-1.66-1.34-3-3-3l-.17.01z"/>
                        </svg>
                    </button>
                    <div class="error-message" id="password-error"></div>
                </div>
                
                
                
                <button type="submit" id="login-button" class="login-button">
                    <span class="button-text">Se connecter</span>
                    <span class="button-loader"></span>
                </button>

                <% if(error!=null){ %>
                    <p class="error-p"><%= error %> </p>
                <% } %>

                <div class="divider">
                    <span>💻</span>
                </div>
                
            </form>
            
        </div>
        
        <div class="background">
            <div class="shape"></div>
            <div class="shape"></div>
        </div>
    </div>
    
    <script src="/assets/js/login.js"></script>
</body>
</html>