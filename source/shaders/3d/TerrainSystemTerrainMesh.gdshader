shader_type spatial;

render_mode cull_back, depth_draw_opaque;

uniform sampler2D albedo_tex;
uniform sampler2D normal_gl_tex;
uniform sampler2D normal_dx_tex;
uniform sampler2D roughness_tex;
uniform sampler2D ambient_occlusion_tex;
uniform sampler2D height_tex;

uniform bool use_dx_normal = false;
uniform float uv_scale = 1.0;
uniform float height_strength = 0.05;

// Called for every vertex the material is visible on.
void vertex() {
    // Optional vertex displacement
    if (height_strength > 0.0) {
        float height = texture(height_tex, UV).r;
        VERTEX.y += height * height_strength;
    }
}

// Called for every pixel the material is visible on.
void fragment() {
    vec2 tiled_uv = UV * uv_scale;

    // --- Albedo ---
    vec3 albedo = texture(albedo_tex, tiled_uv).rgb;
    ALBEDO = albedo;

    // --- Roughness ---
    ROUGHNESS = texture(roughness_tex, tiled_uv).r;

    // --- Ambient Occlusion ---
    AO = texture(ambient_occlusion_tex, tiled_uv).r;

    // --- Normal ---
    vec3 normal_sample;

    if (use_dx_normal) {
        normal_sample = texture(normal_dx_tex, tiled_uv).rgb;
        normal_sample.g = 1.0 - normal_sample.g; // invert green channel
    } else {
        normal_sample = texture(normal_gl_tex, tiled_uv).rgb;
    }

    NORMAL = normal_sample * 2.0 - 1.0;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
