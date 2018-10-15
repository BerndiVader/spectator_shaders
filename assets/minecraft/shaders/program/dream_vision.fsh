uniform sampler2D DiffuseSampler;

varying vec2 texCoord;
varying vec2 inSize;

void main() {
    vec4 c = texture2D(DiffuseSampler, texCoord);
  
    c+=texture2D(DiffuseSampler, texCoord+0.001);
    c+=texture2D(DiffuseSampler, texCoord+0.003);
    c+=texture2D(DiffuseSampler, texCoord+0.005);
    c+=texture2D(DiffuseSampler, texCoord+0.007);
    c+=texture2D(DiffuseSampler, texCoord+0.009);
    c+=texture2D(DiffuseSampler, texCoord+0.011);

    c+=texture2D(DiffuseSampler, texCoord-0.001);
    c+=texture2D(DiffuseSampler, texCoord-0.003);
    c+=texture2D(DiffuseSampler, texCoord-0.005);
    c+=texture2D(DiffuseSampler, texCoord-0.007);
    c+=texture2D(DiffuseSampler, texCoord-0.009);
    c+=texture2D(DiffuseSampler, texCoord-0.011);

    c.rgb=vec3((c.r+c.g+c.b)/3.0);
    c=c/9.5;
    gl_FragColor=c;
}