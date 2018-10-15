uniform sampler2D DiffuseSampler;

varying vec2 texCoord;
const float PI=3.1415926535;

void main(){

    float eye=178.0;
    float eyeHalf=0.5*eye*(PI/180.0);
    float maxf=sin(eyeHalf);

    vec2 uv;
    vec2 xy=2.0*texCoord.xy-1.0;
    float d=length(xy);
    if (d < (2.0-maxf) ) {
        d=length(xy*maxf);
        float z=sqrt(1.0-d*d);
        float r=atan(d,z)/PI;
        float phi=atan(xy.y,xy.x);
        
        uv.x=r*cos(phi)+0.50;
        uv.y=r*sin(phi)+0.50;
    }else{
        uv=texCoord.xy;
    }
    gl_FragColor=texture2D(DiffuseSampler,uv);
}