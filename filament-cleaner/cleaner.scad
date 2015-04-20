// mm

axis_radius = (10+1)/2; // with offset

a = 12;
f_hole_d = 4.5;
b_hole_d = 4;
wall_thickness = 3;
eps = 0.1;

$fa = 0.01;
$fn = 50;

module cleaner() {
 linear_extrude(wall_thickness) difference() {
  square(a, center=true);
  circle(d=f_hole_d);
 }
 difference() {
  linear_extrude(a) difference() {
   square(a+wall_thickness, center=true);
   square(a-wall_thickness, center=true);
  }
  translate([a/2 - wall_thickness/2 - eps/2, 0, a/2]) rotate([0, 90, 0]) cylinder(h=wall_thickness+eps, d=b_hole_d);
 }
}

cleaner();
