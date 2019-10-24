import { writable } from 'svelte/store';

export const image = writable();

export const gl = writable();
export const program = writable();

export const texture = writable();
export const planeMesh = writable();

export const brightness = writable(0);
export const contrast = writable(1.0);
export const saturation = writable(1.0);
