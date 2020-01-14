varying vec3 vT;
varying vec3 vN;
//varying vec3 vE;
varying vec3 vL;
varying vec3 vH;
//varying vec3 vC;

void main()
{
    gl_Position = ftransform();
    gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;
    vec3 Position = -(gl_ModelViewMatrix * gl_Vertex).xyz;
    
    vec3 vE = normalize(Position);
    vL = normalize(gl_LightSource[0].position.xyz + Position);
    vN = gl_NormalMatrix * gl_Normal;
    vT = (gl_ModelViewMatrix * vec4(gl_MultiTexCoord1.xyz,0.)).xyz;
    vH = normalize(vL + vE);
    //vC = gl_Color.rgb;
}
