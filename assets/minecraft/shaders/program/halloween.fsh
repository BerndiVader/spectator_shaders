uniform sampler2D DiffuseSampler;
uniform float AlphaAmount;

varying vec2 texCoord;

void main(){

    vec3 base=texture2D(DiffuseSampler,texCoord).rgb;
    vec3 oc=pow(base.rgb,vec3(0.45));

    float grey=dot(oc.rgb,vec3(0.333));
    float weight=smoothstep(0.07,0.20,oc.r-grey);

    grey=pow(abs(grey*(1.2)),2.0);
    oc=mix(vec3(grey),oc.rgb*vec3(1.0,0.3,0.3),weight);
    oc=pow(abs(oc.rgb),vec3(2.2));

    gl_FragColor=vec4(oc.rgb,AlphaAmount);
}