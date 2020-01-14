varying vec3 lightvec;
varying vec3 halfvec;
varying vec3 lightvec2;
varying vec3 halfvec2;
varying vec3 camVec;

void main()
{
    gl_Position = ftransform();
    
    gl_TexCoord[0] = gl_MultiTexCoord0;

    vec4 lightInEyeSpace= gl_LightSource[0].position;
    vec3 lightInObjSpace= (gl_ModelViewMatrixInverse * lightInEyeSpace).xyz;

    vec4 lightInEyeSpace2= gl_LightSource[1].position;
    vec3 lightInObjSpace2= (gl_ModelViewMatrixInverse * lightInEyeSpace2).xyz;
    
    vec4 eyeVecInEyeSpace= vec4(0, 0, 0, 1);
    vec3 eyeVecInObjSpace= (gl_ModelViewMatrixInverse * eyeVecInEyeSpace).xyz;
    
    camVec = normalize(eyeVecInObjSpace - gl_Vertex.xyz);
    
    lightvec = normalize(lightInObjSpace - gl_Vertex.xyz);
    halfvec = normalize(lightvec + camVec);

    lightvec2 = normalize(lightInObjSpace2 - gl_Vertex.xyz);
    halfvec2 = normalize(lightvec2 + camVec);

    gl_TexCoord[1] = vec4(gl_Normal, 1.0); //vec4((gl_Normal * 0.5) + 0.5, 1);
}
