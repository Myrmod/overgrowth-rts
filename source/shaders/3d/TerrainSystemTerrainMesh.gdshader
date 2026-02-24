shader_type spatial;

render_mode cull_back, depth_draw_opaque;

// ==== CONFIG ====
const int MAX_TERRAINS = 16;
const int MAX_SPLATS = 4; // 4 splat maps * 4 channels = 16 terrains

// ==== Terrain Texture Arrays ====
uniform sampler2D albedo_tex[MAX_TERRAINS];
uniform sampler2D normal_tex[MAX_TERRAINS];
uniform sampler2D roughness_tex[MAX_TERRAINS];
uniform sampler2D ao_tex[MAX_TERRAINS];
uniform sampler2D height_tex[MAX_TERRAINS];

// ==== Splat Maps ====
uniform sampler2D splat_tex[MAX_SPLATS];

uniform int terrain_count = 1;
uniform int splat_count = 1;

uniform float uv_scale = 1.0;
uniform float height_strength = 0.0;

void vertex() {
    if (height_strength > 0.0) {
        vec2 tiled_uv = UV * uv_scale;

        float total_height = 0.0;
        float total_weight = 0.0;

        for (int s = 0; s < MAX_SPLATS; s++) {
            if (s >= splat_count) break;

            vec4 splat = texture(splat_tex[s], UV);

            for (int c = 0; c < 4; c++) {
                int terrain_index = s * 4 + c;
                if (terrain_index >= terrain_count) break;

                float weight = splat[c];
                float h = texture(height_tex[terrain_index], tiled_uv).r;

                total_height += h * weight;
                total_weight += weight;
            }
        }

        if (total_weight > 0.0) {
            VERTEX.y += (total_height / total_weight) * height_strength;
        }
    }
}

void fragment() {
    vec2 tiled_uv = UV * uv_scale;

    vec3 final_albedo = vec3(0.0);
    vec3 final_normal = vec3(0.0);
    float final_roughness = 0.0;
    float final_ao = 0.0;

    float total_weight = 0.0;

    for (int s = 0; s < MAX_SPLATS; s++) {
        if (s >= splat_count) break;

        vec4 splat = texture(splat_tex[s], UV);

        for (int c = 0; c < 4; c++) {
            int terrain_index = s * 4 + c;
            if (terrain_index >= terrain_count) break;

            float weight = splat[c];
            if (weight <= 0.001) continue;

            vec3 albedo = texture(albedo_tex[terrain_index], tiled_uv).rgb;
            vec3 normal = texture(normal_tex[terrain_index], tiled_uv).rgb * 2.0 - 1.0;
            float rough = texture(roughness_tex[terrain_index], tiled_uv).r;
            float ao = texture(ao_tex[terrain_index], tiled_uv).r;

            final_albedo += albedo * weight;
            final_normal += normal * weight;
            final_roughness += rough * weight;
            final_ao += ao * weight;

            total_weight += weight;
        }
    }

    if (total_weight > 0.0) {
        final_albedo /= total_weight;
        final_normal = normalize(final_normal / total_weight);
        final_roughness /= total_weight;
        final_ao /= total_weight;
    }

    ALBEDO = final_albedo;
    NORMAL = final_normal;
    ROUGHNESS = final_roughness;
    AO = final_ao;
}