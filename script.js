// Script para interactividad de la página

// Manejo del menú hamburguesa
document.addEventListener('DOMContentLoaded', function() {
    const hamburger = document.querySelector('.hamburger');
    const navMenu = document.querySelector('.nav-menu');

    if (hamburger) {
        hamburger.addEventListener('click', function() {
            navMenu.style.display = navMenu.style.display === 'flex' ? 'none' : 'flex';
        });
    }

    // Cerrar menú al hacer clic en un enlace
    const navLinks = document.querySelectorAll('.nav-menu a');
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            if (navMenu.style.display === 'flex') {
                navMenu.style.display = 'none';
            }
        });
    });

    // Manejo del formulario de contacto
    const formulario = document.getElementById('formulario-contacto');
    if (formulario) {
        formulario.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Validar que todos los campos estén completos
            const formData = new FormData(formulario);
            
            // Aquí puedes agregar lógica para enviar el formulario
            // Por ahora, mostraremos un mensaje de éxito
            alert('¡Gracias por tu mensaje! Nos pondremos en contacto pronto.');
            formulario.reset();
        });
    }

    // Animación de scroll suave
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });

    // Efecto de reveal en elementos al hacer scroll
    const revealElements = document.querySelectorAll('.servicio-card, .tratamiento-item, .diferencial');
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.animation = 'slideUp 0.6s ease forwards';
            }
        });
    }, {
        threshold: 0.1
    });

    revealElements.forEach(element => {
        element.style.opacity = '0';
        observer.observe(element);
    });
});

// Agregar animación de slideUp
const style = document.createElement('style');
style.textContent = `
    @keyframes slideUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
`;
document.head.appendChild(style);

// Función para manejar envío de formulario (opcional - requiere backend)
async function enviarFormulario(e) {
    e.preventDefault();
    
    const formData = new FormData(e.target);
    const data = {
        nombre: formData.get('nombre'),
        email: formData.get('email'),
        telefono: formData.get('telefono'),
        mensaje: formData.get('mensaje')
    };

    try {
        // Reemplazar con tu URL de backend
        const response = await fetch('https://tu-servidor.com/api/mensajes', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });

        if (response.ok) {
            alert('¡Mensaje enviado correctamente!');
            e.target.reset();
        } else {
            alert('Error al enviar el mensaje. Intenta más tarde.');
        }
    } catch (error) {
        console.error('Error:', error);
        alert('Error de conexión. Intenta de nuevo más tarde.');
    }
}

// Efecto de parallax en el hero (opcional)
window.addEventListener('scroll', () => {
    const heroImage = document.querySelector('.hero-image img');
    if (heroImage) {
        heroImage.style.transform = `translateY(${window.scrollY * 0.5}px)`;
    }
});
