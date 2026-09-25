(() => {
  'use strict';

  const hero = document.querySelector('.hero-section');
  if (!hero) return;

  const style = document.createElement('style');
  style.textContent = `
    .hero-section { position: relative; overflow: hidden; isolation: isolate; }
    #light-rays-canvas { position: absolute; inset: 0; width: 100%; height: 100%; z-index: 0; pointer-events: none; }
    .hero-section > :not(#light-rays-canvas) { position: relative; z-index: 1; }
    @media (max-width: 700px) {
      .hero-section { text-align: center; }
      .hero-headline { width: 100%; max-width: 22rem; margin-inline: auto; line-height: 1.2; text-wrap: balance; }
      .hero-subhead { width: 100%; max-width: 36rem; margin-inline: auto; text-wrap: pretty; }
      .hero-ctas { width: min(100%, 22rem); margin-inline: auto; flex-direction: column; align-items: stretch; gap: 10px; }
      .hero-ctas .btn { width: 100%; min-height: 46px; }
    }
    @media (prefers-reduced-motion: reduce) { #light-rays-canvas { display: none; } }
  `;
  document.head.appendChild(style);

  const canvas = document.createElement('canvas');
  canvas.id = 'light-rays-canvas';
  canvas.setAttribute('aria-hidden', 'true');
  hero.prepend(canvas);

  const ctx = canvas.getContext('2d');
  if (!ctx) return;

  let width = 1;
  let height = 1;
  let dpr = 1;
  let frame = 0;
  let mouseX = 0.5;
  let mouseY = 0.5;

  const resize = () => {
    const rect = hero.getBoundingClientRect();
    dpr = Math.min(window.devicePixelRatio || 1, 2);
    width = Math.max(1, rect.width);
    height = Math.max(1, rect.height);
    canvas.width = Math.round(width * dpr);
    canvas.height = Math.round(height * dpr);
    canvas.style.width = `${width}px`;
    canvas.style.height = `${height}px`;
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
  };

  const updateMouse = event => {
    mouseX = event.clientX / Math.max(window.innerWidth, 1);
    mouseY = event.clientY / Math.max(window.innerHeight, 1);
  };

  const render = time => {
    ctx.clearRect(0, 0, width, height);

    const originX = width * (0.5 + (mouseX - 0.5) * 0.08);
    const originY = -height * 0.2;
    const spread = Math.max(width * 0.8, 420);
    const pulse = 0.92 + Math.sin(time * 0.001) * 0.08;

    ctx.save();
    ctx.globalCompositeOperation = 'screen';

    for (let index = -7; index <= 7; index += 1) {
      const offset = index * spread * 0.075;
      const gradient = ctx.createLinearGradient(originX, originY, originX + offset, height);
      gradient.addColorStop(0, `rgba(255,255,255,${0.025 * pulse})`);
      gradient.addColorStop(0.36, `rgba(255,255,255,${0.1 * pulse})`);
      gradient.addColorStop(1, 'rgba(255,255,255,0)');

      ctx.beginPath();
      ctx.moveTo(originX + index * 8, originY);
      ctx.lineTo(originX + offset - spread * 0.12, height);
      ctx.lineTo(originX + offset + spread * 0.12, height);
      ctx.closePath();
      ctx.fillStyle = gradient;
      ctx.fill();
    }

    ctx.restore();
    frame = requestAnimationFrame(render);
  };

  window.addEventListener('resize', resize, { passive: true });
  window.addEventListener('pointermove', updateMouse, { passive: true });
  resize();
  frame = requestAnimationFrame(render);

  window.addEventListener('pagehide', () => {
    cancelAnimationFrame(frame);
    window.removeEventListener('resize', resize);
    window.removeEventListener('pointermove', updateMouse);
  }, { once: true });
})();
