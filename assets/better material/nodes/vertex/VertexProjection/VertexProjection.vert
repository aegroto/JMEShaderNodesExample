void main(){
    projectedPosition = gWorldViewProjectionMatrix * vec4(vVertex, 1.0);
}