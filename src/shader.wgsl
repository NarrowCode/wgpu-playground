// Info:
// vs_main = entry point (vertex shader)
// fs_main = entry point (fragment shader)
// Both *must* be named differently, according to WGSL spec

// Vertex shader
// Struct to hold the shader output
struct VertexOutput {
  // Position value in *framebuffer space*
  @builtin(position) clip_position: vec4<f32>,
};

// Entry point for our vertex shader
@vertex
fn vs_main(
  @builtin(vertex_index) in_vertex_index: u32,
) -> VertexOutput {
  var out: VertexOutput;
  let x = f32(1 - i32(in_vertex_index)) * 0.5;
  let y = f32(i32(in_vertex_index &1u) * 2 - 1) * 0.5;
  out.clip_position = vec4<f32>(x, y, 0.0, 1.0);
  return out;
}

// Fragment shader 
// @location(0) means store the output in the first color target
@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
  return vec4<f32>(0.3, 0.2, 0.1, 1.0);
}
