shader_type canvas_item;

uniform bool active;
uniform float freq;
uniform vec3 flash_color: source_color = vec3(1.0);

void fragment() {
	if (active){
		COLOR = vec4(mix(COLOR.rgb,flash_color,sin(TIME*freq)/2.0+.5),COLOR.a);
	}
}

