uniform mat4 g_WorldViewProjectionMatrix;
uniform float g_Time;
uniform float m_RotationSpeed;
uniform float m_MeshScale;

attribute vec3 inPosition;
attribute vec2 inTexCoord;

varying vec2 texCoord;

void main() {
    #ifdef TEXTURED
        texCoord = inTexCoord;
    #endif

    vec3 vVertex = inPosition;

    #ifdef ROTATION
        float angle = g_Time * m_RotationSpeed;

        vVertex = vec3(inPosition.x * cos(angle) + inPosition.z * (-sin(angle)),
                       inPosition.y,
                       inPosition.x * sin(angle) + inPosition.z * cos(angle)
                    );
    #endif

    #ifdef SCALING
        vVertex *= m_MeshScale;
    #endif

    gl_Position = g_WorldViewProjectionMatrix * vec4(vVertex, 1.0);
}