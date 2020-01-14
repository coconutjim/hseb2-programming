uniform sampler2D AugapfelTex;

varying vec3 Position;
varying vec3 eyePos;
varying vec3 normal;
varying vec4 lightVec;

void main()
{
        vec3 vV = normalize(eyePos - Position);
        vec3 vN = normalize(normal);
        vec3 vL = normalize(lightVec.xyz);
        vec3 vH = normalize(vL + vV);

        float spec = pow(max(dot(vN,vH),0.),56.);
        float s2 = smoothstep(0.70,0.95, spec);
        spec = spec * ((1.0 - 0.5) + 0.5 * s2);
        vec3 specularLight = vec3(0.5,0.5,0.6);
        specularLight *= (spec + 0.2);

        vec3 texCol = texture2D(AugapfelTex,
                (gl_TexCoord[0].st - vec2(0.5,0.5)) * vec2(2,1) + vec2(0.5,0.5) ).rgb;
        float wrapDiffuse = max(0., (dot(vL, vN) + 1.) / 2.);
        texCol *= wrapDiffuse;
        texCol *= vec3(1.05,1.05,1.10);
        texCol += specularLight;

        gl_FragColor = vec4(texCol, 1.0);
}
