precision mediump float;

varying vec2 v_texcoord;

uniform sampler2D u_texture;
uniform float u_brightness;
uniform float u_contrast;
uniform float u_saturation;

void main() {
  vec4 sampleColor = texture2D(u_texture, v_texcoord);

  // Brightness
  sampleColor = vec4(clamp(sampleColor.rgb + u_brightness, 0.0, 1.0), 1.0);

  // Contrast
  sampleColor = vec4(u_contrast * (sampleColor.rgb - 0.5) + 0.5, 1.0);

  // Saturation
  float desaturated = (sampleColor.x + sampleColor.y + sampleColor.z) / 3.0;
  sampleColor = (1.0 - u_saturation) * vec4(vec3(desaturated), 1) + u_saturation * sampleColor;

  gl_FragColor = sampleColor;
}
