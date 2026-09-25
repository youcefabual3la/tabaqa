/* Landing-page integration for the static HTML entry point. */
(() => {
  const hero = document.querySelector('.hero-section');
  if (!hero) return;

  hero.classList.add('hero-rays-host');

  const rays = document.createElement('div');
  rays.className = 'light-rays-container light-rays-static';
  rays.setAttribute('aria-hidden', 'true');
  hero.prepend(rays);

  const canvas = document.createElement('canvas');
  rays.appendChild(canvas);
  const context = canvas.getContext('2d');
  if (!context) return;

  let frame = 0;
  let width = 0;
  let height = 0;
  let pointerX = 0.5;
  let pointerY = 0.2;
  const color = 'rgba(255,255,255,.14)';

  const resize = () => {
    const rect = hero.getBoundingClientRect();
    const dpr = Math.min(window.devicePixelRatio || 1, 2);
    width = Math.max(1, rect.width);
    height = Math.max(1, rect.height);
    canvas.width = width * dpr;
    canvas.height = height * dpr;
    canvas.style.width = `${width}px`;
    canvas.style.height = `${height}px`;
    context.setTransform(dpr, 0, 0, dpr, 0, 0);
  };

  const draw = time => {
    context.clearRect(0, 0, width, height);
    const originX = width * (0.5 + (pointerX - 0.5) * 0.08);
    const originY = -height * 0.08;
    const spread = Math.max(width * 0.65, 360);
    const pulse = 0.96 + Math.sin(time * 0.001) * 0.04;
    context.save();
    context.globalCompositeOperation = 'screen';
    for (let i = -5; i <= 5; i += 1) {
      const offset = i * spread * 0.08;
      const gradient = context.createLinearGradient(originX, originY, originX + offset, height);
      gradient.addColorStop(0, `rgba(255,255,255,${0.025 * pulse})`);
      gradient.addColorStop(0.42, color);
      gradient.addColorStop(1, 'rgba(255,255,255,0)');
      context.beginPath();
      context.moveTo(originX + i * 8, originY);
      context.lineTo(originX + offset - spread * 0.18, height);
      context.lineTo(originX + offset + spread * 0.18, height);
      context.closePath();
      context.fillStyle = gradient;
      context.fill();
    }
    context.restore();
    frame = requestAnimationFrame(draw);
  };

  window.addEventListener('resize', resize);
  window.addEventListener('pointermove', event => {
    pointerX = event.clientX / window.innerWidth;
    pointerY = event.clientY / window.innerHeight;
  }, { passive: true });
  resize();
  frame = requestAnimationFrame(draw);

  window.addEventListener('pagehide', () => {
    cancelAnimationFrame(frame);
    window.removeEventListener('resize', resize);
  }, { once: true });
})();
