uniform sampler2D Tex;

varying vec2 texCoord;

void main() {
    vec4 color = texture2D(Tex, texCoord);

    gl_FragColor = color;
}