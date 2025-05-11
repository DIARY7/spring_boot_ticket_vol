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
            
            <form id="login-form" method="post" action="/login">
                <div class="input-group">
                    <input type="text" id="email" name="pseudo" required>
                    <label for="email">Pseudo</label>
                    <div class="line"></div>
                    <div class="error-message" id="email-error"></div>
                </div>
                
                <div class="input-group">
                    <input type="password" id="password" required name="motDePasse">
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
                
                <div class="options-group">
                    <div class="remember-me">
                        <input type="checkbox" id="remember" class="custom-checkbox">
                        <label for="remember">Se souvenir de moi</label>
                    </div>
                    <a href="#" class="forgot-password">Mot de passe oublié ?</a>
                </div>
                
                <button type="submit" id="login-button" class="login-button">
                    <span class="button-text">Se connecter</span>
                    <span class="button-loader"></span>
                </button>
                
                <div class="divider">
                    <span>ou</span>
                </div>
                
                <div class="social-login">
                    <button type="button" class="social-button google">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                            <path d="M12.545,10.239v3.821h5.445c-0.712,2.315-2.647,3.972-5.445,3.972c-3.332,0-6.033-2.701-6.033-6.032s2.701-6.032,6.033-6.032c1.498,0,2.866,0.549,3.921,1.453l2.814-2.814C17.503,2.988,15.139,2,12.545,2C7.021,2,2.543,6.477,2.543,12s4.478,10,10.002,10c8.396,0,10.249-7.85,9.426-11.748L12.545,10.239z"/>
                        </svg>
                        Google
                    </button>
                    <button type="button" class="social-button facebook">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                            <path d="M20.9,2H3.1C2.5,2,2,2.5,2,3.1v17.8C2,21.5,2.5,22,3.1,22h9.6v-7.7h-2.6v-3h2.6V9.2c0-2.6,1.6-4,3.9-4c1.1,0,2.1,0.1,2.3,0.1v2.7h-1.6c-1.3,0-1.5,0.6-1.5,1.5v1.9h3l-0.4,3h-2.6V22h5.1c0.6,0,1.1-0.5,1.1-1.1V3.1C22,2.5,21.5,2,20.9,2z"/>
                        </svg>
                        Facebook
                    </button>
                </div>
                
                <div class="signup-link">
                    Pas encore de compte ? <a href="#">S'inscrire</a>
                </div>
            </form>
            
            <div id="success-message" class="success-message">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/>
                </svg>
                <h2>Connexion réussie !</h2>
                <p>Vous allez être redirigé...</p>
            </div>
        </div>
        
        <div class="background">
            <div class="shape"></div>
            <div class="shape"></div>
        </div>
    </div>
    
    <script src="/assets/js/login.js"></script>
</body>
</html>