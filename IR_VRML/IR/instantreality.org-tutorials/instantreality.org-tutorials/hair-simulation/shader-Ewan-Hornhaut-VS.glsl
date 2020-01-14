varying vec3 Position;
varying vec3 eyePos;
varying vec3 normal;
varying vec3 lightVec;

void main()
{
    vec3 lightPos = gl_LightSource[1].position.xyz;
    Position = gl_Vertex.xyz;
    lightPos = (gl_ModelViewMatrixInverse * vec4(lightPos, 1.0)).xyz;
    lightVec = vec3(lightPos - Position);
    lightVec = normalize(lightVec);
    gl_Position = ftransform();
    normal = gl_Normal;
    eyePos = (gl_ModelViewMatrixInverse * vec4(0, 0, 0, 1)).xyz;
}
