uniform sampler2D irisTex;
uniform vec4 eyeData;

varying vec3 Position;
varying vec3 eyePos;
varying vec3 normal;
varying vec3 lightVec;

float intersectPlane(vec3 rayOrigin, vec3 rayDir, vec4 plane)
{
    vec3 planeNormal = plane.xyz;
    float delta1 = dot(planeNormal, rayDir);
    float result = -1.0;

    if (delta1 < 0.0)
    {
        //float delta2 = -plane.w - dot(planeNormal, rayOrigin);
        float delta2 = -dot(planeNormal, rayOrigin) + plane.w ;
        result = delta2/delta1;
    }
    return result;
}

void main()
{
    vec3 yAxis = vec3(0.0, 1.0, 0.0);
    vec3 zAxis = vec3(0.0, 0.0, 1.0);
    vec3 hitColor = vec3(1.0,1.0,1.0);
    vec3 faceColor = vec3(0.0,1.0,0.0);

    float irisDist = eyeData.x;
    float slice = Position.z - irisDist;
    vec4 planeEquation = vec4(zAxis, irisDist);

    vec3 vV = normalize(eyePos - Position);
    vec3 vN = normalize(normal);

    //spec light
    vec3 vL = normalize(lightVec);
    vec3 vH = normalize(vL + vV);
    float spec = pow(max(0.0, dot(vN , vH)), 90.0);

    float s2 = smoothstep(0.7,0.75, spec);
    spec= spec * ((1.0 - 0.4) + 0.4 * s2);
    vec3 specLight = vec3(0.9,0.9,0.9) * spec;

    float falloff = (1.0 - max(dot(normalize(vV), normalize(vN)), 0.0) );
    float steep = eyeData.w;
    falloff = exp(steep * falloff) / exp(steep);
    vec3 falloffCol = vec3(0.5,0.5,0.6);
    falloffCol *= falloff;

    if (slice >= 0.0)
    {
        float eta = 1.0 / eyeData.y;
        float cosI = dot(vV, vN);
        float cosTrans = 1.0 - eta * eta * (1.0 - cosI * cosI);

        if (cosTrans >= 0.0)
        {
            vec3 vR = (eta * cosI - sqrt(cosTrans)) * vN - eta * vV;
            //plane intersect
            float t = intersectPlane(Position, vR, planeEquation);
            faceColor = vec3(0.0,0.0,0.0);

            //if (t > 0.0 )
            {
                vec3 irisPoint  = Position + t * (vR);
                vec3 irisLookUp = (eyeData.z * irisPoint) + vec3( 0.5, 0.5, 0.0 );
                faceColor       = texture2D( irisTex, irisLookUp.xy ).rgb;
            }

            hitColor =(faceColor+specLight) + falloffCol;
        }
    }

    gl_FragColor = vec4(hitColor, 1.0);
}
