/************************************************************************

    arm.scad
    
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

include <alu_profile.scad>

module arm(isRight, isPrint)
{
    // Slot
    move([148-15,11.5,0]) {
        difference() {
            cuboid([20,33 - 3,10 - 3], chamfer=1.5);
            if(!isRight) move([0,5.5,14 - 4]) cuboid([92,8,20]);
        }
    }

    // Arm
    move([186.5,11.5,0]) yrot(-15, cp=[-49,0,0]) {
        difference() {
            cuboid([100,33,10], chamfer=2, edges=EDGES_X_ALL+EDGES_RIGHT);
            move([-58,0,3]) yrot(15) cuboid([20,35,15]);

            // Cable channel
            if (isRight) move([-3 + 5,-5.5,9]) cuboid([80,8,20]);
            else  move([-5,5.5,9]) cuboid([92,8,20]);
        }
    }
}

module render_arm_left(crend, toPrint)
{
    if (toPrint) {
        xrot(-90) move([-118,7,35.5]) yrot(15) {
            difference() {
                move([0, -35,0]) arm(false);
                move([0, -(57 + 35 + 290),0])render_profile_bar_cut();
            }
        }
    } else {
        difference() {
            move([0, 57 + 290,0]) arm(false);
            render_profile_bar_cut();
        }
    }
   
}

module render_arm_right(crend, toPrint)
{
    if (toPrint) {
        xrot(90) move([-118,5,35.5]) yrot(15) {
            difference() {
                arm(true);
                render_profile_bar_cut();
            }
        }
    } else {
        difference() {
            arm(true);
            render_profile_bar_cut();
        }
    }
}