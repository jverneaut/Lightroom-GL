attribute vec2 a_position;
attribute vec2 a_texcoord;

varying vec2 v_texcoord;
varying vec2 v_position;

void main() {
  gl_Position = vec4(a_position, 0, 1);
  v_texcoord = a_texcoord;
  v_position = a_position;
}
