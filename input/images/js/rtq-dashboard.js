document.addEventListener('DOMContentLoaded', () => {
    const navItems = document.querySelectorAll('.sidebar .nav-item');
    navItems.forEach(item => {
        const href = item.getAttribute('href');
        if (!href || !href.startsWith('#')) return;
        const targetId = href.substring(1);
        if (targetId === 'overview' || targetId === 'participants') return;
        
        const section = document.getElementById(targetId);
        if (section) {
            let count = 0;
            let nextEl = section.nextElementSibling;
            while (nextEl && !nextEl.classList.contains('section-title')) {
                if (nextEl.classList.contains('question-card')) {
                    count++;
                }
                nextEl = nextEl.nextElementSibling;
            }
            const badge = item.querySelector('.count-pill');
            if (badge) {
                badge.textContent = count;
            }
        }
    });
});
