precision mediump float;

varying vec2 v_texcoord;
varying vec2 v_position;

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
  sampleColor = u_contrast * (sampleColor - 0.5) + 0.5;

  // Saturation
  float saturation = 1.0;
  float desaturated = (sampleColor.x + sampleColor.y + sampleColor.z) / 3.0;
  sampleColor = (1.0 - u_saturation) * vec4(vec3(desaturated), 1) + u_saturation * sampleColor;

  gl_FragColor = sampleColor;
}
