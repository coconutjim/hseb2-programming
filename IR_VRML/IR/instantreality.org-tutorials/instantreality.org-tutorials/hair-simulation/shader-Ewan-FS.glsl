uniform sampler2D textureMap;
uniform sampler2D detailMap;
uniform sampler2D lookupMap;
uniform sampler2D specMap;
uniform sampler2D complexionMap;

uniform float paleHead;
uniform float paleCheeks;
uniform float redHead;
uniform float redCheeks;
            
varying vec3 lightvec;
varying vec3 halfvec;
varying vec3 lightvec2;
varying vec3 halfvec2;
varying vec3 camVec;

void main()
{
    // -------------------- fetch textures --------------------------
    vec3 texCol = texture2D(textureMap, gl_TexCoord[0].st).xyz;
    vec3 specmapCol = texture2D(specMap, gl_TexCoord[0].st).xyz;

	vec4 emotion = texture2D(complexionMap, gl_TexCoord[0].st);

	float grey = (paleCheeks * emotion.b + paleHead * emotion.r) * 0.5;
	float red = 1.1 * (redCheeks * emotion.b + redHead * emotion.g);

	vec3 lumCol = vec3(1.5,1.4,1.4) * ((texCol.r + texCol.g + texCol.b) / 3.0);
	texCol = texCol * (1. - grey) + lumCol * grey;
    
    vec2 texcoord = gl_TexCoord[0].st * 10.;
    vec3 detCol = texture2D(detailMap, texcoord).xyz;
 
    //vec3 normalVec=2.*(texture2D(normalMap,texcoord).xyz-0.5);
    vec3 normalVec = gl_TexCoord[1].xyz;

    detCol = 2. * (detCol - 0.5);
    normalVec = normalize(normalVec + detCol * 0.5);

    // ------------------------ calc light 1 -------------------
    vec2 texTmp;
    texTmp.x = dot(normalVec, lightvec) * 0.5 + 0.5;
    texTmp.y = dot(normalVec, halfvec);

    vec4 lookupCol1 = texture2D(lookupMap, texTmp.st).xzzy;

    // ----------------------- calc light 2 -------------------
    texTmp.x = dot(normalVec, lightvec2) * 0.5 + 0.5;
    texTmp.y = dot(normalVec, halfvec2);
    
    vec4 lookupCol2 = texture2D(lookupMap, texTmp.st).xzzy;
    vec4 lookupCol = (lookupCol1 + lookupCol2);

    float steep = 5.;
    float falloff = exp(-steep * max(dot(camVec, normalVec), 0.));
    vec3 scatterCol = 0.4 * vec3(1.0, 0.7, 0.4) * falloff;

    vec3 texcol = (texCol + red * vec3(0.9, 0.4, 0.3)) * (lookupCol.xyz*2.);
    vec3 speccol = specmapCol.xyz * lookupCol.w * 1.5;
    //speccol *= vec3(2.0, 1.9, 1.3);

    vec3 basecol = texcol + (vec3(1.,1.,1.) - texcol) * speccol + scatterCol;

    gl_FragColor = vec4(basecol, 1.);
}
