uniform mat4 g_WorldViewProjectionMatrix;
uniform float g_Time;

attribute vec3 inPosition;
attribute vec2 inTexCoord;

varying vec2 texCoord;

void main() {
    texCoord = inTexCoord;
    vec3 vVertex = inPosition;

    // Transform
    #ifdef TRANSFORM
        float angle = g_Time * 2.0;

        vVertex = vec3(inPosition.x *  cos(angle)   + inPosition.y * sin(angle),
                            inPosition.x * (-sin(angle)) + inPosition.y * cos(angle),
                            inPosition.z *  cos(angle)   + inPosition.y * sin(angle));
    #endif

    gl_Position = g_WorldViewProjectionMatrix * vec4(vVertex, 1.0);
}