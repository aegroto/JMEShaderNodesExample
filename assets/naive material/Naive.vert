uniform mat4 g_WorldViewProjectionMatrix;
uniform float g_Time;
uniform float m_TransformSpeed;
uniform float m_MeshScale;

attribute vec3 inPosition;
attribute vec2 inTexCoord;

varying vec2 texCoord;

void main() {
    texCoord = inTexCoord;
    vec3 vVertex = inPosition;

    // Transform
    #ifdef TRANSFORM
        float angle = g_Time * m_TransformSpeed;

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