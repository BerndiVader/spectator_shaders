uniform sampler2D DiffuseSampler;

varying vec2 texCoord;
varying vec2 inSize;

//#define T texture2D(DiffuseSampler,.5+(p.xy*=.992))
#define T texture2D(DiffuseSampler,.5+(p.xy*=.992))

void main() {
    vec3 res=vec3(1600.0,900.0,0.8);
    vec3 base=texture2D(DiffuseSampler,texCoord).rgb;
    vec3 p = gl_FragCoord.xyz/res-.5;
    vec3 o = T.rgb;
    for (float i=0.;i<100.;i++){
        p.z += pow(max(0.,.5-length(T.rgb)),2.)*exp(-i*.08);
    } 
    o*=o+p.z;
    gl_FragColor=vec4(o,1);
}