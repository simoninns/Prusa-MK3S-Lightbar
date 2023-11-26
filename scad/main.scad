/************************************************************************

    main.scad
    
    Prusa Light
    Copyright (C) 2022 Simon Inns
    
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
include <axis_mount.scad>
include <arm.scad>
include <alu_profile.scad>

// Rendering resolution
$fn=30;

// Select rendering parameters
use_colour = "Colour"; // [Colour, No colour]
for_printing = "Display"; // [Display, Printing]

display_axis_mount_left = "Yes"; // [Yes, No]
display_axis_mount_right = "Yes"; // [Yes, No]

display_arm_left = "Yes"; // [Yes, No]
display_arm_right = "Yes"; // [Yes, No]

display_alu_profile = "Yes"; // [Yes, No]

display_axis_mount_left_support = "Yes"; // [Yes, No]
display_axis_mount_right_support = "Yes"; // [Yes, No]

// Render the required items
module main()
{
    crend = (use_colour == "Colour") ? true:false;
    toPrint = (for_printing == "Printing") ? true:false;

    d_axis_mount_left = (display_axis_mount_left == "Yes") ? true:false;
    d_axis_mount_right = (display_axis_mount_right == "Yes") ? true:false;

    d_arm_left = (display_arm_left == "Yes") ? true:false;
    d_arm_right = (display_arm_right == "Yes") ? true:false;

    d_alu_profile = (display_alu_profile == "Yes") ? true:false;

    d_axis_mount_left_support = (display_axis_mount_left_support == "Yes") ? true:false;
    d_axis_mount_right_support = (display_axis_mount_right_support == "Yes") ? true:false;

    if (d_axis_mount_left) render_axis_mount_left(crend, toPrint);
    if (d_axis_mount_right) render_axis_mount_right(crend, toPrint);
    if (d_arm_left) render_arm_left(crend, toPrint);
    if (d_arm_right) render_arm_right(crend, toPrint);
    if (d_alu_profile) render_alu_profiles(crend, toPrint);

    // Support enforcers
    if (d_axis_mount_left_support) render_axis_mount_left_support(crend, toPrint);
    if (d_axis_mount_right_support) render_axis_mount_right_support(crend, toPrint);
}

main();