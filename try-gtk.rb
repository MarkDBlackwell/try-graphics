#!/usr/bin/ruby
=begin
http://ruby-gnome2.sourceforge.jp/?News_20120115_1
http://zetcode.com/tutorials/rubygtktutorial/
gem install gtk2

Derived from
http://zetcode.com/tutorials/rubygtktutorial/
=end

require 'gtk2'

class RubyApp < Gtk::Window
  def initialize
    super
    set_title "Hi, Megan"
    signal_connect "destroy" do
      Gtk.main_quit
    end
    set_default_size 1000, 1000
    set_window_position Gtk::Window::POS_CENTER
    show
  end
end

Gtk.init
  window = RubyApp.new
Gtk.main
