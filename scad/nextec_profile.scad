/************************************************************************

	nextec_profile.scad
    
	Prusa MK3S dual-light bar
    Copyright (C) 2020 Simon Inns
	
    This file is part of MK3S_Lightbar.
    
    This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <roundedcube.scad>;

module end_grip()
{
    translate([-3,-3,-1]) {
        difference(){
            roundedcube([16 + 6, 6.3 + 6, 20 + 1], false, radius = 1.0, apply_to = "all");
            translate([3 - 0.5,3 - 0.5,2]) {
                cube([16+1, 6.3+1, 20]);
            }

            translate([16/2 - 1, 4, -2]){
                roundedcube([8, 4, 6], false, radius = 1.0, apply_to = "all");
            }
        }
    }
}

module end_holder(gap_distance)
{
    // Grip 1
    translate([0,0.5,0]) {
        end_grip();
    }

    // Grip 2
    translate([gap_distance,0.5,0]) {
        end_grip();
    }

    // Join the grips
    translate([16 + 2,-1,-1]) {
        roundedcube([gap_distance - 20, 9, 21], false, radius = 1.0, apply_to = "x");
    }

    // Holder
    translate([-20,-1,-1]) {
        roundedcube([gap_distance - 22, 9, 21], false, radius = 1.0, apply_to = "x");
    }
}

module holder(separ)
{
    spacing = separ ? 40:20;
    rot1 = separ ? -90:0;
    rot2 = separ ? 160:0;
    trans1 = separ ? 40:0;
    trans2 = separ ? -1:0;

    translate([0,trans2,trans1]) {
        rotate([rot1,rot2,0]) {
            translate([spacing,8,2]) {
                difference() {
                    rotate([0,0,20]) {
                        translate([0,0,0]) {
                            end_holder(40);
                        }
                    }

                    translate([-28,-8,-2]) {
                        cube([10,12,24]);
                    }
                }
            
                // Plug (to arm)
                translate([-28,-6,0.5]) {
                    roundedcube([10,6,18], false, radius = 1.0, apply_to = "x");
                }
            }
        }
    }
}
    
module arm()
{
    translate([0,0,0]) {
        difference() {
            // Main arm
            roundedcube([-100,10,23], false, radius = 1.0, apply_to = "all");

            // Cutout 1
            translate([-10, -5, 4.5]) {
                roundedcube([-20,20,14], false, radius = 1.0, apply_to = "all");
            }

            // Cutout 2
            translate([-40, -5, 4.5]) {
                roundedcube([-25,20,14], false, radius = 1.0, apply_to = "all");
            }

            // Cutout 3
            translate([-75, -5, 4.5]) {
                roundedcube([-20,20,14], false, radius = 1.0, apply_to = "all");
            }
            
            // Socket (from holder)
            translate([-9,2,2.5]) {
                roundedcube([12,6,18], false, radius = 1.0, apply_to = "x");
            }
        }
    }
}
