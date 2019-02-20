$fn=90;

module holder_positive(h, w, l) {
    // base
    translate([0, 0, 0])
        cube([w, l, 2]);
    translate([0, 0, 0])
        cube([2, l, 8]);
    translate([w - 2, 0, 0])
        cube([2, l, 8]);

    // wall R/
    translate([0, l, 0])
        cube([w, 2, h]);
    translate([0, l + 2/2, h])
        rotate([90, 0, 90])
            cylinder(d=2, h=w);
    
    // wall L
    translate([0, 0, 0])
        cube([w, 2, h]);
    translate([0, -2, h])
        rotate([90, 0, 90])
            cylinder(d = 19, w);
}

module holder_negative(h, w, l) {
    // base
    translate([w / 2, (l+2) / 2, 0])
        cylinder(d=8, h=8);

    // wall L
    translate([0, -20, 0])
        cube([w, 20, h + 19/2]);
    translate([0, -2, h])
        rotate([90, 0, 90])
            cylinder(d = 16, w);
}

module holder(h, w, l) {
    difference() {
        holder_positive(h, w, l);
        holder_negative(h, w, l);
    }
}

holder(40, 35, 15);