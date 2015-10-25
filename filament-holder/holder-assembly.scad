// mm

ab = 120;
h = 50;
at = ab+2*h;
d = 20; d2 = sqrt(2)*d;
bearing_outer_diam = 22 + 0.5; // with offset
bearing_inner_diam = 8 + 1; // with offset
bearing_thickness = 3.5; // approximate

pad = 0.8;

axis_radius = (10+1)/2; // with offset
axis_distance = 68.5 - 10;
cut_depth = 10;

z1 = 5;
z2 = 10;

$fa = 0.01;
$fn = 50;

module global_cuts() {
 translate([0, 0, -z2]) linear_extrude(3*z2) union() {
  translate([cut_depth - axis_radius, axis_distance/2]) circle(axis_radius);
  translate([cut_depth - axis_radius, -axis_distance/2]) circle(axis_radius);
  translate([-100, axis_distance/2 - axis_radius]) square([cut_depth - axis_radius + 100, 2*axis_radius]);
  translate([-100, (-axis_distance/2) - axis_radius]) square([cut_depth - axis_radius + 100, 2*axis_radius]);
  translate([(h+d)/2, (at/2 - d2 + ab/2 + d - d2)/2]) circle(d=bearing_inner_diam);
  translate([(h+d)/2, (-ab/2 - d + d2 -at/2 + d2)/2]) circle(d=bearing_inner_diam);
  translate([0, at/2-10]) square([h+1, 1000]);
  translate([0, -(1000+at/2-10)]) square([h+1, 1000]);
 }
}

module bearings() {
 translate([0, 0, - bearing_thickness - pad]) linear_extrude(bearing_thickness) {
  difference() {
   union() {
    translate([(h+d)/2, (at/2 - d2 + ab/2 + d - d2)/2]) circle(d=bearing_outer_diam);
    translate([(h+d)/2, (-ab/2 - d + d2 -at/2 + d2)/2]) circle(d=bearing_outer_diam);
   }
   union() {
    translate([(h+d)/2, (at/2 - d2 + ab/2 + d - d2)/2]) circle(d=bearing_inner_diam);
    translate([(h+d)/2, (-ab/2 - d + d2 -at/2 + d2)/2]) circle(d=bearing_inner_diam);
   }
  }
 }
}

module thin_contour() {
 linear_extrude(z1) polygon([[0, -ab/2], [0,ab/2], [h, at/2], [h,-at/2]]);
}

sq_depth = 10;

module to_axes() {
 linear_extrude(z1 + sq_depth) {
  intersection() {
   union() {
    translate([cut_depth - axis_radius, axis_distance/2]) circle(axis_radius*3);
    translate([cut_depth - axis_radius, -axis_distance/2]) circle(axis_radius*3);
   }
   translate([cut_depth - axis_radius, -50]) square(100, 100);
  }

 }
}

add_w = 30;
add_h = 10;
module additional_base() {
 linear_extrude(z1) {
  translate([-add_h, axis_distance/2 - add_w/2]) square([add_h, add_w]);
  translate([-add_h, -axis_distance/2 - add_w/2]) square([add_h, add_w]);
 }
}

module holder() {
 difference() {
  union() {
   thin_contour();
   to_axes();
   additional_base();
  }
  union() {
   global_cuts();
  }
 }
}

module spools_100() {
 #translate([127, 0, z1]) linear_extrude(5) circle(d=197);
 #translate([143, 0, z1]) linear_extrude(5) circle(d=223);
}

module spools_120() {
 //#translate([122, 0, -z1]) linear_extrude(5) circle(d=197);
 #translate([138, 0, -z1]) linear_extrude(5) circle(d=223);
}

module half() {
 holder();
 color("grey") bearings();
 spools_120();
}

half();
translate([0, 0, -100]) rotate([180, 0, 0]) half();
#translate([138, 0, -100]) linear_extrude(100) circle(d=50);
color("silver") translate([(h+d)/2, (at/2 - d2 + ab/2 + d - d2)/2, -150 + 25]) linear_extrude(150) circle(d=bearing_inner_diam-0.1);
color("silver") translate([(h+d)/2, (-ab/2 - d + d2 -at/2 + d2)/2, -150 + 25]) linear_extrude(150) circle(d=bearing_inner_diam-0.1);

$vpr = [180, 65, 90];
$vpt = [100, 0, 0];
