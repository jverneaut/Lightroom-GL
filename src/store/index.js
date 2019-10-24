import { writable } from 'svelte/store';

export const brightness = writable(0);
export const contrast = writable(1.0);
export const saturation = writable(1.0);

export const image = writable();
