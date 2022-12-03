// Color Overlay Fragment Shader

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
	vec3 hsvColor = vec3((gl_FragCoord.x-300.)/1366.*1.5,1,1);
	vec3 rgbColor = hsv2rgb(hsvColor);
	gl_FragColor = vec4(rgbColor.x, rgbColor.y, rgbColor.z, 1.0);
}
