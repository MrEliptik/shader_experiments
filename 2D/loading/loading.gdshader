shader_type canvas_item;

uniform float percentage: hint_range(0.0, 1.0) = 1.0;

void fragment() {
	vec4 main_tx = texture(TEXTURE, UV);
    float avg = (main_tx.r + main_tx.g + main_tx.b) / 3.0;
	COLOR.rgb = main_tx.rgb * step(UV.x, percentage) + (vec3(avg) * step(percentage, UV.x));
	COLOR.a = main_tx.a;
}