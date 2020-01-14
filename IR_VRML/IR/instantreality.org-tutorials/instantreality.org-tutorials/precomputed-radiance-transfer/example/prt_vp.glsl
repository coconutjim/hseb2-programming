uniform vec3 coefficients[16];

vec3 convolve()
{
    return (coefficients[0]  * gl_MultiTexCoord0.s +
            coefficients[1]  * gl_MultiTexCoord0.t +
            coefficients[2]  * gl_MultiTexCoord0.p +
            coefficients[3]  * gl_MultiTexCoord0.q +
            coefficients[4]  * gl_MultiTexCoord1.s +
            coefficients[5]  * gl_MultiTexCoord1.t +
            coefficients[6]  * gl_MultiTexCoord1.p +
            coefficients[7]  * gl_MultiTexCoord1.q +
            coefficients[8]  * gl_MultiTexCoord2.s +
            coefficients[9]  * gl_MultiTexCoord2.t +
            coefficients[10] * gl_MultiTexCoord2.p +
            coefficients[11] * gl_MultiTexCoord2.q +
            coefficients[12] * gl_MultiTexCoord3.s +
            coefficients[13] * gl_MultiTexCoord3.t +
            coefficients[14] * gl_MultiTexCoord3.p +
            coefficients[15] * gl_MultiTexCoord3.q);
}

void main()
{
         gl_FrontColor = vec4(convolve(), 1) * gl_Color * 0.35;
         gl_Position   = ftransform();
}