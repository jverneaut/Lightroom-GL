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
    <input type="number" bind:value={$brightness} />
    <h1>Contrast</h1>
    <input type="number" bind:value={$contrast} />
    <h1>Saturation</h1>
    <input type="number" bind:value={$saturation} />
  </Sidebar>
</main>
