uniform sampler2D m_Tex;
uniform float m_TexScale;

varying vec2 texCoord;

void main() {
    vec4 color = texture2D(m_Tex, texCoord.xy / m_TexScale);

    gl_FragColor = color;
}