<script>
  import { image as storeImage } from '../store';

  const onChange = e => {
    const file = e.target.files[0];
    const reader = new FileReader();

    reader.onload = e => {
      const image = new Image();
      image.onload = e => {
        storeImage.update(storeImage => (storeImage = image));
      };
      image.src = e.target.result;
    };

    reader.readAsDataURL(file);
  };
</script>

<input type="file" id="input" on:change={onChange} />
