const N: usize = 100000;
struct Swarm { x: [f64; N], y: [f64; N], vx: [f64; N], vy: [f64; N] }

fn main() {
    let mut s = Swarm { x: [0.0; N], y: [0.0; N], vx: [0.1; N], vy: [0.1; N] };
    for _ in 0..1000 {
        for i in 0..N {
            s.x[i] += s.vx[i];
            s.y[i] += s.vy[i];
        }
    }
}