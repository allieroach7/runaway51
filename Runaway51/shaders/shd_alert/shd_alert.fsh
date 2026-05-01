varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_intensity;

void main()
{
    vec4 col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    // Red alert tint based on intensity
    col.r *= 1.0 + (0.4 * u_intensity);
    col.g *= 1.0 - (0.3 * u_intensity);
    col.b *= 1.0 - (0.3 * u_intensity);
    
    gl_FragColor = col;
}