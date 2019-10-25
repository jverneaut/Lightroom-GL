<script>
  import { onMount } from 'svelte';

  import { image as storeImage } from '../store';

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
