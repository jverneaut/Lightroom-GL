precision mediump float;

varying vec2 v_texcoord;

uniform sampler2D u_texture;
uniform float u_brightness;
uniform float u_contrast;
uniform float u_saturation;

void main() {
  vec4 sampleColor = texture2D(u_texture, v_texcoord);

  // Brightness
  sampleColor.x = max(0.0, sampleColor.x + u_brightness);
  sampleColor.y = max(0.0, sampleColor.y + u_brightness);
  sampleColor.z = max(0.0, sampleColor.z + u_brightness);

  // Contrast
  sampleColor.x = u_contrast * (sampleColor.x - 0.5) + 0.5;
  sampleColor.y = u_contrast * (sampleColor.y - 0.5) + 0.5;
  sampleColor.z = u_contrast * (sampleColor.z - 0.5) + 0.5;

  // Saturation
  float desaturated = (sampleColor.x + sampleColor.y + sampleColor.z) / 3.0;
  sampleColor = (1.0 - u_saturation) * vec4(vec3(desaturated), 1) + u_saturation * sampleColor;

  gl_FragColor = sampleColor;
}
