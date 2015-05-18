$fn=50;

max_x = 234;
max_y = 251;
origin_x = -1;
origin_y = 5;
hole_d = 9;

linear_extrude(1) {
 difference() {
  square([max_x,max_y]);
  union() {
   translate([max_x-9,125,0]) circle(d=hole_d);
   translate([10,max_y-61,0]) circle(d=hole_d);
   translate([10,61,0]) circle(d=hole_d);
  }
 }
}
color("red") translate([origin_x, origin_y, 1]) circle(d=1);
