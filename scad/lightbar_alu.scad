/************************************************************************

	lightbar_alu.scad
    
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

// Nextec Aluminium profile for LED strips
// Kjell and Company article number 36321
// "Nextec Aluminiumprofil utanpåliggande för LED-lister"

// External dimensions 16.00mm x 6.30mm x 1000mm
// 1.5mm thick alu

module alu_profile(length)
{
    
    difference(){
        cube([16,6.30,length]); // Profile external dimensions
        
        translate([1.5/2.0,1.5/2.0,0]) {
            cube([16 - 1.5,6.30,length]); // Profile internal
        }
    }
    
}