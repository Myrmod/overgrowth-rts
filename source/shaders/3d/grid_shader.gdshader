shader_type spatial;
render_mode unshaded, transparent, cull_disabled;

uniform float cell_size = 1.0;
uniform float line_width : hint_range(0.01, 0.15) = 0.05;
uniform vec4 line_color : source_color = vec4(0.2, 1.0, 0.3, 0.4);
uniform vec4 fill_color : source_color = vec4(0.2, 1.0, 0.3, 0.0);

varying vec3 world_pos;

void vertex() {
	world_pos = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
}

void fragment() {
	vec2 uv = world_pos.xz / cell_size;
	vec2 grid = abs(fract(uv) - 0.5);
	float half_line = line_width * 0.5 / cell_size;
	float on_line = 1.0 - step(0.5 - half_line, max(grid.x, grid.y));

	vec3 col = mix(fill_color.rgb, line_color.rgb, on_line);
	float alpha = mix(fill_color.a, line_color.a, on_line);
	ALBEDO = col;
	ALPHA = alpha;
}
