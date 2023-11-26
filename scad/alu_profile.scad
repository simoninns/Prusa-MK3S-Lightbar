/************************************************************************

    alu_profile.scad
    
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

module profile_bar()
{
    cuboid([17,350, 7]);
}

module profile_bar_cut()
{
    cuboid([17 + 1,350 + 1, 7 + 1]);
}

module render_profile_bar_cut()
{
    move([160,5,-7.25]) yrot(-15, cp=[-49,0,0]) {
        move([0,360/2,0]) profile_bar_cut();
        move([30,360/2,0]) profile_bar_cut();
        move([30+30,360/2,0]) profile_bar_cut();
    }
}

module render_alu_profiles(crend, toPrint)
{
    if (!toPrint) {
        move([160,5,-7.25]) yrot(-15, cp=[-49,0,0]) {
            move([0,360/2,0]) profile_bar();
            move([30,360/2,0]) profile_bar();
            move([30+30,360/2,0]) profile_bar();
        }
    }
}