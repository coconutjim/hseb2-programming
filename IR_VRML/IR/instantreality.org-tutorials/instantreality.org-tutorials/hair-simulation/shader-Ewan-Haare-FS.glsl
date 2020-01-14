uniform sampler2D hairTex;
uniform sampler2D noise;

uniform float shiftValue1;
uniform float shiftValue2;

uniform vec3  ambientColor;
uniform vec3  diffuseColor;
uniform vec3  specularColor1;
uniform vec3  specularColor2;

uniform float shininess1;
uniform float shininess2;
uniform float scattering;

varying vec3 vT;
varying vec3 vN;
//varying vec3 vE;
varying vec3 vL;
varying vec3 vH;
//varying vec3 vC;


float calcHighlight(vec3 tangent, vec3 normal, vec3 halfVec,
                          float shininess, float shiftValue)
{
    vec3 result = normalize(tangent + shiftValue * normal);

    float dotHalfVecTangent = dot(result, halfVec);
    float specular = sqrt(1.0 - dotHalfVecTangent * dotHalfVecTangent);

    return pow(specular, shininess);
}

void main()
{
    vec4 hairTexColor = texture2D(hairTex, gl_TexCoord[0].st);
    // hairTexColor.rgb += 0.4*vec3(gl_TexCoord[0].t);
#if 0
    if (hairTexColor.a <= 0.1)
    {
        discard;
    }
    else
#endif
    {
        //shift vTs for different specular terms
        float shiftTex = texture2D(noise, gl_TexCoord[0].st).r;

        //subsurface scattering fake, only diffuse
        float LdotN = dot(vL, vN);
        float wrapDiffuse = max(0., (LdotN + scattering) / (1. + scattering));

        vec3 diffuse = wrapDiffuse * diffuseColor;

        vec3 ambient = ambientColor; // * vC;

        //compute two specular terms in hair color
        vec3 specular1 = specularColor1 *
                         calcHighlight(vT, vN, vH, shininess1, shiftValue1 + shiftTex);

        //2nd sparkled highlight
        vec3 specular2 = specularColor2 * shiftTex *
                         calcHighlight(vT, vN, vH, shininess2, shiftValue2 + shiftTex);

        float scaledSteps = smoothstep(0., 0.75, (1. + LdotN) / 2.);
        vec3 color = (scaledSteps*(specular1 + specular2 + diffuse) + ambient) * hairTexColor.rgb;

        gl_FragColor = vec4(color, hairTexColor.a);
    }
}
