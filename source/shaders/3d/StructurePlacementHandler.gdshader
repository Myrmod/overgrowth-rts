shader_type spatial;
render_mode unshaded, transparent;

uniform float cell_size = 2.0;
uniform vec4 line_color : source_color = vec4(0.2,1.0,0.3,0.5);

void fragment() {
	vec2 uv = WORLD_POSITION.xz / cell_size;
	vec2 g = abs(fract(uv) - 0.5);
	float line = step(0.48, max(g.x, g.y));
	ALBEDO = line_color.rgb;
	ALPHA = line * line_color.a;
}
