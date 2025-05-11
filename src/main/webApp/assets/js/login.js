document.addEventListener('DOMContentLoaded', function() {
    // Elements
    const loginForm = document.getElementById('login-form');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const emailError = document.getElementById('email-error');
    const passwordError = document.getElementById('password-error');
    const togglePasswordBtn = document.getElementById('toggle-password');
    const loginButton = document.getElementById('login-button');
    const successMessage = document.getElementById('success-message');
    const rememberCheckbox = document.getElementById('remember');
    
    // Check if user has saved credentials
    checkSavedCredentials();
    
    // Toggle password visibility
    togglePasswordBtn.addEventListener('click', function() {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        
        const eyeOpen = this.querySelector('.eye-open');
        const eyeClosed = this.querySelector('.eye-closed');
        
        if (type === 'text') {
            eyeOpen.style.display = 'none';
            eyeClosed.style.display = 'block';
        } else {
            eyeOpen.style.display = 'block';
            eyeClosed.style.display = 'none';
        }
        
        // Add ripple effect
        const ripple = document.createElement('span');
        ripple.classList.add('ripple');
        this.appendChild(ripple);
        
        setTimeout(() => {
            ripple.remove();
        }, 600);
    });
    
    // Form validation
    loginForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        let isValid = true;
        
        // Reset errors
        emailError.textContent = '';
        emailError.classList.remove('show');
        passwordError.textContent = '';
        passwordError.classList.remove('show');
        
        // Validate email
        if (!emailInput.value) {
            showError(emailError, 'Le pseudo est requis');
            isValid = false;
        } 
        
        // Validate password
        if (!passwordInput.value) {
            showError(passwordError, 'Le mot de passe est requis');
            isValid = false;
        }
        
        if (isValid) {
            // Show loading state
            loginButton.classList.add('loading');
            
            // Simulate API call
            setTimeout(function() {
                loginButton.classList.remove('loading');
                
                // Save credentials if "Remember me" is checked
                if (rememberCheckbox.checked) {
                    localStorage.setItem('savedEmail', emailInput.value);
                    // In a real app, never store passwords in localStorage
                    // This is just for demonstration
                    localStorage.setItem('hasPassword', 'true');
                } else {
                    localStorage.removeItem('savedEmail');
                    localStorage.removeItem('hasPassword');
                }
                
                // Show success message
                successMessage.classList.add('show');
                
                // Redirect after 2 seconds (in a real app, this would go to the dashboard)
                setTimeout(function() {
                    // window.location.href = '/dashboard';
                    // For demo, just reset the form
                    successMessage.classList.remove('show');
                    loginForm.reset();
                }, 2000);
            }, 1500);
        }
        e.target.submit();
    });
    
    // Input animations
    const inputs = document.querySelectorAll('.input-group input');
    
    inputs.forEach(input => {
        // Check if input has value on load
        if (input.value) {
            input.classList.add('has-value');
        }
        
        // Check if input has value on change
        input.addEventListener('input', function() {
            if (this.value) {
                this.classList.add('has-value');
            } else {
                this.classList.remove('has-value');
            }
        });
    });
    
    
    function showError(element, message) {
        element.textContent = message;
        element.classList.add('show');
        
        // Add shake animation to the parent input
        const inputGroup = element.closest('.input-group');
        inputGroup.classList.add('shake');
        
        setTimeout(() => {
            inputGroup.classList.remove('shake');
        }, 500);
    }
    
    function checkSavedCredentials() {
        const savedEmail = localStorage.getItem('savedEmail');
        const hasPassword = localStorage.getItem('hasPassword');
        
        if (savedEmail) {
            emailInput.value = savedEmail;
            // Trigger the label animation
            emailInput.classList.add('has-value');
            
            if (hasPassword) {
                // Fill password with dots for visual indication
                passwordInput.value = '••••••';
                passwordInput.classList.add('has-value');
                rememberCheckbox.checked = true;
            }
        }
    }
    
    // Add ripple effect to buttons
    const buttons = document.querySelectorAll('button');
    
    buttons.forEach(button => {
        button.addEventListener('click', function(e) {
            if (this.classList.contains('toggle-password')) return;
            
            const x = e.clientX - e.target.getBoundingClientRect().left;
            const y = e.clientY - e.target.getBoundingClientRect().top;
            
            const ripple = document.createElement('span');
            ripple.classList.add('ripple');
            ripple.style.left = `${x}px`;
            ripple.style.top = `${y}px`;
            
            this.appendChild(ripple);
            
            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });
    
    // Add CSS for ripple effect
    const style = document.createElement('style');
    style.textContent = `
        button {
            position: relative;
            overflow: hidden;
        }
        
        .ripple {
            position: absolute;
            background: rgba(255, 255, 255, 0.5);
            border-radius: 50%;
            transform: scale(0);
            animation: ripple 0.6s linear;
            pointer-events: none;
        }
        
        @keyframes ripple {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
        
        .shake {
            animation: shake 0.5s cubic-bezier(.36,.07,.19,.97) both;
        }
        
        @keyframes shake {
            10%, 90% {
                transform: translateX(-1px);
            }
            20%, 80% {
                transform: translateX(2px);
            }
            30%, 50%, 70% {
                transform: translateX(-4px);
            }
            40%, 60% {
                transform: translateX(4px);
            }
        }
    `;
    document.head.appendChild(style);
});