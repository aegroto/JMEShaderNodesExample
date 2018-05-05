void main(){
    float angle = gTime * mRotationSpeed;

    rotatedPosition = vec3(inPosition.x * cos(angle) + inPosition.z * (-sin(angle)),
                           inPosition.y,
                           inPosition.x * sin(angle) + inPosition.z * cos(angle)
                        );
}