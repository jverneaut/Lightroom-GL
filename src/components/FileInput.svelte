<script>
  import { onMount } from 'svelte';

  import { image as storeImage, brightness, contrast, saturation } from '../store';

  import defaultImage from '../img/lena.png';

  onMount(() => {
    const image = document.createElement('img');
    image.onload = () => {
      $storeImage = image;
    };
    image.src = defaultImage;
  });

  const onChange = e => {
    $storeImage = null;

    // TODO: Store these parameters in a config to avoid duplication
    $brightness = 0.0;
    $contrast = 1.0;
    $saturation = 1.0;

    const file = e.target.files[0];
    const reader = new FileReader();

    reader.onload = e => {
      const image = new Image();
      image.onload = e => {
        $storeImage = image;
      };
      image.src = e.target.result;
    };

    reader.readAsDataURL(file);
  };
</script>

<input type="file" id="input" on:change={onChange} />
