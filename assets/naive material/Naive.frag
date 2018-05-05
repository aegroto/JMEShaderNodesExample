uniform sampler2D m_Tex;
uniform float m_TexScale;
uniform vec4 m_OverlayColor;

varying vec2 texCoord;

void main() {
    vec4 outColor = vec4(1.0, 1.0, 1.0, 1.0);
    #ifdef TEXTURED
        outColor = texture2D(m_Tex, texCoord.xy / m_TexScale);
    #endif

    #ifdef COLORED
        outColor = (outColor + m_OverlayColor) / 2.0;
    #endif

    gl_FragColor = outColor;
}