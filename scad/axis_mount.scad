/************************************************************************

    axis_mount.scad
    
    Prusa MK3S Lightbar
    Copyright (C) 2023 Simon Inns
    
    This is free software: you can redistribute it and/or modify
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

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

// Local includes
include <z-axis-top.scad>

module render_axis_mount_left(crend, toPrint)
{
    if (toPrint) {
        difference() {
            z_top_left();

            // Cable channel
            move([94.5,-18,16 - 6]) cuboid([94,8,20]);
            move([42.5,-11,16 - 6]) zrot(-45) cuboid([22,8,20]);
        }
    } else {
        move([0, 92 + 290,0]) {
            difference() {
                z_top_left();

                // Cable channel
                move([94.5,-18,16 - 6]) cuboid([94,8,20]);
                move([42.5,-11,16 - 6]) zrot(-45) cuboid([22,8,20]);
            }
        }
    }
}

module render_axis_mount_right(crend, toPrint)
{
    z_top_right();
}

module render_axis_mount_left_support(crend, toPrint)
{
    if (toPrint) {
        translate([0,-12,0]) mirror([0,1,0]) {
            // Slot
            move([148-17,11.5,1]) cuboid([14,27,9]);
        }
    }
}

module render_axis_mount_right_support(crend, toPrint)
{
    if (toPrint) {
        // Slot
        move([148-17,11.5,1]) cuboid([14,27,9]);
    }
}