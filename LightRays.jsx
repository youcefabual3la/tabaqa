import { useEffect, useRef } from 'react';
import { Mesh, Program, Renderer, Triangle } from 'ogl';
import './light-rays.css';

const hexToRgb = hex => {
  const match = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  return match ? match.slice(1).map(channel => parseInt(channel, 16) / 255) : [1, 1, 1];
};

const getAnchorAndDir = (origin, width, height) => {
  const outside = 0.2;
  const positions = {
    'top-left': [[0, -outside * height], [0, 1]],
    'top-right': [[width, -outside * height], [0, 1]],
    left: [[-outside * width, height * 0.5], [1, 0]],
    right: [[(1 + outside) * width, height * 0.5], [-1, 0]],
    'bottom-left': [[0, (1 + outside) * height], [0, -1]],
    'bottom-center': [[width * 0.5, (1 + outside) * height], [0, -1]],
    'bottom-right': [[width, (1 + outside) * height], [0, -1]],
    'top-center': [[width * 0.5, -outside * height], [0, 1]]
  };
  const [anchor, dir] = positions[origin] || positions['top-center'];
  return { anchor, dir };
};

const vertex = `attribute vec2 position; varying vec2 vUv; void main(){ vUv=position*.5+.5; gl_Position=vec4(position,0.,1.); }`;
const fragment = `precision highp float; uniform float iTime; uniform vec2 iResolution; uniform vec2 rayPos; uniform vec2 rayDir; uniform vec3 raysColor; uniform float raysSpeed; uniform float lightSpread; uniform float rayLength; uniform vec2 mousePos; uniform float mouseInfluence; varying vec2 vUv; float strength(vec2 source,vec2 direction,vec2 coord,float seed,float speed){ vec2 delta=coord-source; float angle=dot(normalize(delta),direction); float spread=pow(max(angle,0.),1./max(lightSpread,.001)); float distance=length(delta); float falloff=clamp((iResolution.x*rayLength-distance)/(iResolution.x*rayLength),0.,1.); float wave=.45+.15*sin(angle*seed+iTime*speed)+.3+.2*cos(-angle*seed+iTime*speed); return clamp(wave,0.,1.)*falloff*spread; } void main(){ vec2 coord=vec2(gl_FragCoord.x,iResolution.y-gl_FragCoord.y); vec2 direction=normalize(mix(rayDir,normalize(mousePos*iResolution-rayPos),mouseInfluence)); float rays=strength(rayPos,direction,coord,36.2,1.5*raysSpeed)*.5+strength(rayPos,direction,coord,22.4,1.1*raysSpeed)*.4; float brightness=1.-coord.y/iResolution.y; gl_FragColor=vec4(raysColor*rays*(.1+brightness*.8),rays); }`;

export default function LightRays({ raysOrigin = 'top-center', raysColor = '#ffffff', raysSpeed = 1, lightSpread = 0.5, rayLength = 3, followMouse = true, className = '' }) {
  const containerRef = useRef(null);

  useEffect(() => {
    const container = containerRef.current;
    if (!container || typeof window === 'undefined') return undefined;
    const renderer = new Renderer({ alpha: true, dpr: Math.min(window.devicePixelRatio || 1, 2) });
    const { gl } = renderer;
    gl.canvas.setAttribute('aria-hidden', 'true');
    gl.canvas.style.cssText = 'width:100%;height:100%;display:block;';
    container.replaceChildren(gl.canvas);
    const uniforms = {
      iTime: { value: 0 }, iResolution: { value: [1, 1] }, rayPos: { value: [0, 0] }, rayDir: { value: [0, 1] },
      raysColor: { value: hexToRgb(raysColor) }, raysSpeed: { value: raysSpeed }, lightSpread: { value: lightSpread }, rayLength: { value: rayLength },
      mousePos: { value: [0.5, 0.5] }, mouseInfluence: { value: followMouse ? 0.1 : 0 }
    };
    const mesh = new Mesh(gl, { geometry: new Triangle(gl), program: new Program(gl, { vertex, fragment, uniforms }) });
    const mouse = { x: 0.5, y: 0.5 };
    const resize = () => { const w = container.clientWidth; const h = container.clientHeight; renderer.setSize(w, h); uniforms.iResolution.value = [w * renderer.dpr, h * renderer.dpr]; const placement = getAnchorAndDir(raysOrigin, w * renderer.dpr, h * renderer.dpr); uniforms.rayPos.value = placement.anchor; uniforms.rayDir.value = placement.dir; };
    const move = event => { mouse.x = event.clientX / window.innerWidth; mouse.y = 1 - event.clientY / window.innerHeight; };
    let frame = 0;
    const render = time => { uniforms.iTime.value = time / 1000; uniforms.mousePos.value = [mouse.x, mouse.y]; renderer.render({ scene: mesh }); frame = requestAnimationFrame(render); };
    window.addEventListener('resize', resize); window.addEventListener('pointermove', move, { passive: true }); resize(); frame = requestAnimationFrame(render);
    return () => { cancelAnimationFrame(frame); window.removeEventListener('resize', resize); window.removeEventListener('pointermove', move); gl.getExtension('WEBGL_lose_context')?.loseContext(); container.replaceChildren(); };
  }, [raysOrigin, raysColor, raysSpeed, lightSpread, rayLength, followMouse]);

  return <div ref={containerRef} className={`light-rays-container ${className}`.trim()} aria-hidden="true" />;
}
