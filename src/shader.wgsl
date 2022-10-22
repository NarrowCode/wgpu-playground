// Info:
// vs_main = entry point (vertex shader)
// fs_main = entry point (fragment shader)
// Both *must* be named differently, according to WGSL spec

// Vertex shader

// Struct to accept shader input
struct VertexInput {
  @location(0) position: vec3<f32>,
  @location(1) color: vec3<f32>,
}

// Struct to hold the shader output
struct VertexOutput {
  // Position value in *framebuffer space*
  @builtin(position) clip_position: vec4<f32>,
  @location(0) color: vec3<f32>,
};

// Entry point for our vertex shader
@vertex
fn vs_main(
  model: VertexInput,
) -> VertexOutput {
  var out: VertexOutput;
  out.color = model.color;
  out.clip_position = vec4<f32>(model.position, 1.0);
  return out;
}

// Fragment shader 
// @location(0) means store the output in the first color target
@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
  return vec4<f32>(in.color, 1.0);
}
