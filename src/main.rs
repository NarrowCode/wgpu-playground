use hello_web::run;

fn main() {
    pollster::block_on(run());
}
