<script>
  import Preview from './Preview.svelte';
  import Sidebar from './Sidebar.svelte';
  import FileInput from './FileInput.svelte';

  import SEO from './SEO.svelte';

  import { brightness, contrast, saturation } from '../store';
</script>

<SEO title="Lightroom" />

<main>
  <Preview />
  <Sidebar>
    <FileInput />
    <h1>Brightness</h1>
    <input type="range" bind:value={$brightness} min="-0.5" max="0.5" step="0.001" />
    <h1>Contrast</h1>
    <input type="range" bind:value={$contrast} min="0.0" max="2.0" step="0.001" />
    <h1>Saturation</h1>
    <input type="range" bind:value={$saturation} min="0.0" max="2.0" step="0.001" />
  </Sidebar>
</main>
