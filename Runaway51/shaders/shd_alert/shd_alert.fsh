varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_intensity;

void main()
{
    vec4 col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    // Strong red alert tint
    col.r *= 1.0 + (0.8 * u_intensity);
    col.g *= 1.0 - (0.5 * u_intensity);
    col.b *= 1.0 - (0.5 * u_intensity);
    
    gl_FragColor = col;
}