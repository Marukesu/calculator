/* Copyright 2014 Marvin Beckers <ma-be@posteo.de>
*
* This file is part of Calculus.
*
* Calculus is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* Calculus is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with Calculus. If not, see http://www.gnu.org/licenses/.
*/

using Gtk;
using Calculus.Core;
using Granite.Widgets;

namespace Calculus {
    public class MainWindow : Gtk.Window {
        private Gtk.HeaderBar headerbar;
        private Gtk.Grid main_grid;
        private Gtk.Grid sub_grid_1;
        private Gtk.Grid sub_grid_2;
        private Gtk.Entry entry;
        
        private string[] button_types = { "0", "1", "2", "3",
                                          "4", "5", "6", "7",
                                          "8", "9", "0", "+",
                                          "-", "*", "/", "%",
                                          ".", "(", ")" };
        
        public MainWindow () {
            headerbar = new Gtk.HeaderBar ();
            main_grid = new Gtk.Grid ();
            sub_grid_1 = new Gtk.Grid ();
            sub_grid_2 = new Gtk.Grid ();
            
            headerbar.get_style_context ().add_class ("primary-toolbar");
            headerbar.show_close_button = true;
            
            this.set_titlebar (headerbar);
            this.set_resizable (false);
            this.window_position = Gtk.WindowPosition.CENTER;
            
            build_ui ();
        }
        
        public void build_ui () {
            main_grid.expand = true;
            
            sub_grid_1.expand = true;
            sub_grid_1.orientation = Gtk.Orientation.VERTICAL;
            sub_grid_1.set_column_spacing (2);
            sub_grid_1.set_row_spacing (2);
            sub_grid_1.margin = 10;
            
            entry = new Gtk.Entry ();
            entry.set_size_request (250, 40);
            sub_grid_1.attach (entry, 0, 0, 3, 1);
            
            var button_back = new Gtk.Button.from_icon_name ("go-previous", Gtk.IconSize.SMALL_TOOLBAR);
            button_back.set_size_request(50, 40);
            button_back.hexpand = true;
            
            var button_del = new Gtk.Button.from_icon_name ("dialog-close", Gtk.IconSize.SMALL_TOOLBAR);
            button_del.set_size_request(50, 40);
            button_del.hexpand = true;
            
            var button_add = new Gtk.Button.with_label ("+");
            var button_sub = new Gtk.Button.with_label ("-");
            var button_mult = new Gtk.Button.with_label ("*");
            var button_div = new Gtk.Button.with_label ("/");

            var button_bracket_left = new Gtk.Button.with_label ("(");
            var button_bracket_right = new Gtk.Button.with_label (")");
            
            var button_calc = new Gtk.Button.with_label ("=");

            var button_0 = new Gtk.Button.with_label ("0");
            var button_point = new Gtk.Button.with_label (".");
            var button_percent = new Gtk.Button.with_label ("%");
            
            var button_1 = new Gtk.Button.with_label ("1");
            var button_2 = new Gtk.Button.with_label ("2");
            var button_3 = new Gtk.Button.with_label ("3");
            
            var button_4 = new Gtk.Button.with_label ("4");
            var button_5 = new Gtk.Button.with_label ("5");
            var button_6 = new Gtk.Button.with_label ("6");
            
            var button_7 = new Gtk.Button.with_label ("7");
            var button_8 = new Gtk.Button.with_label ("8");
            var button_9 = new Gtk.Button.with_label ("9");
            
            //force size on all buttons in the grid
            button_0.set_size_request(0, 50);
            button_1.set_size_request(0, 50);
            button_4.set_size_request(0, 50);
            button_7.set_size_request(0, 50);
            
            //attach all buttons
            sub_grid_1.attach (button_7, 0, 1, 1, 1);
            sub_grid_1.attach (button_8, 1, 1, 1, 1);
            sub_grid_1.attach (button_9, 2, 1, 1, 1);
            
            sub_grid_1.attach (button_4, 0, 2, 1, 1);
            sub_grid_1.attach (button_5, 1, 2, 1, 1);
            sub_grid_1.attach (button_6, 2, 2, 1, 1);
            
            sub_grid_1.attach (button_1, 0, 3, 1, 1);
            sub_grid_1.attach (button_2, 1, 3, 1, 1);
            sub_grid_1.attach (button_3, 2, 3, 1, 1);
            
            sub_grid_1.attach (button_0, 0, 4, 1, 1);
            sub_grid_1.attach (button_point, 1, 4, 1, 1);
            sub_grid_1.attach (button_percent, 2, 4, 1, 1);
            
            sub_grid_1.attach (button_back, 4, 0, 1, 1);
            sub_grid_1.attach (button_del, 5, 0, 1, 1);
            sub_grid_1.attach (button_add, 4, 1, 1, 1);
            sub_grid_1.attach (button_sub, 5, 1, 1, 1);
            sub_grid_1.attach (button_mult, 4, 2, 1, 1);
            sub_grid_1.attach (button_div, 5, 2, 1, 1);
            sub_grid_1.attach (button_bracket_left, 4, 3, 1, 1);
            sub_grid_1.attach (button_bracket_right, 5, 3, 1, 1);
            sub_grid_1.attach (button_calc, 4, 4, 2, 1);
            
            button_0.clicked.connect (button_clicked);
            button_1.clicked.connect (button_clicked);
            button_2.clicked.connect (button_clicked);
            button_3.clicked.connect (button_clicked);
            button_4.clicked.connect (button_clicked);
            button_5.clicked.connect (button_clicked);
            button_6.clicked.connect (button_clicked);
            button_7.clicked.connect (button_clicked);
            button_8.clicked.connect (button_clicked);
            button_9.clicked.connect (button_clicked);
            
            button_add.clicked.connect (button_clicked);
            button_sub.clicked.connect (button_clicked);
            button_div.clicked.connect (button_clicked);
            button_mult.clicked.connect (button_clicked);
            
            button_bracket_left.clicked.connect (button_clicked);
            button_bracket_right.clicked.connect (button_clicked);
            
            button_point.clicked.connect (button_clicked);
            button_percent.clicked.connect (button_clicked);
            
            button_calc.clicked.connect (button_calc_clicked);
            button_back.clicked.connect (button_back_clicked);
            button_del.clicked.connect (button_del_clicked);
            
            sub_grid_1.show_all ();
            main_grid.attach (sub_grid_1, 0, 0, 1, 1);
            main_grid.show_all ();
            this.add (main_grid);
            this.show_all ();
        }
        
                private void button_clicked (Gtk.Button btn) {
            var label = btn.get_label ();
            foreach (var val in button_types) {
                if (label == val) {
                        entry.set_text (entry.get_text () + val);
                    break;
                }
            }
        }
        
        private void button_calc_clicked () {
            if (entry.get_text () != "") {
                double d = 0;
                try {
                    d = Parser.parse (entry.get_text ());
                } catch (PARSER_ERROR e) { stdout.printf (e.message + " \n"); }

                entry.set_text (d.to_string ());
            }
        } 
        
        private void button_back_clicked () {
            entry.backspace ();
        }
        
        private void button_del_clicked () {
            entry.set_text ("");
        }
    }
}