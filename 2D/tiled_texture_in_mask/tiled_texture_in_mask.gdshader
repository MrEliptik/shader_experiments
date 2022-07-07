shader_type canvas_item;

uniform sampler2D pattern;
uniform float tile_factor: hint_range(0.0, 10.0);
uniform vec2 tile_offset = vec2(0.0);

void fragment() {
	vec2 pattern_pixel_size = 1.0 / vec2(textureSize(pattern, 0));
	vec2 diff = pattern_pixel_size / TEXTURE_PIXEL_SIZE;
	
	vec4 in_tex = texture(TEXTURE, UV);
	
	// brings the uv to -1, 1
	vec2 centered_uv = UV * 2.0 - 1.0;
	vec2 tiled_uv = centered_uv * tile_factor * diff;
	
	// brings back the uv to 0, 1
	tiled_uv  = tiled_uv * 0.5 + 0.5;
	
	tiled_uv += tile_offset;
	vec4 pattern_tex = texture(pattern, tiled_uv);
	COLOR.rgb = pattern_tex.rgb;
	COLOR.a = pattern_tex.a * in_tex.a;
}