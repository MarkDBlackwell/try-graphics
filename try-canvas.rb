require 'gtk2'

    class RubyApp < Gtk::Window
      def initialize
        super
        set_title "#{ARGV.at 0} - longest increasing subsequence"
        signal_connect('destroy'){Gtk.main_quit}
        init_ui
#        set_default_size 1000, 1000
        set_default_size 360,100
        set_window_position Gtk::Window::POS_CENTER
        show_all
      end

      def init_ui
#        add (fixed = Gtk::Fixed.new)
#        button = Gtk::Button.new 'Quit'
#        button.set_size_request 80, 35
#        button.signal_connect('clicked'){Gtk.main_quit}
#        fixed.put button, 50, 50

        p Gtk.constants

        #c = Gtk::GnomeCanvasLine.new

        @darea = Gtk::DrawingArea.new
        @darea.signal_connect('expose-event'){on_expose}
        add @darea
      end

      def on_expose
        cr = @darea.window.create_cairo_context
        draw_colors cr
      end

      def draw_colors cr
        cr.set_source_rgb 0.2, 0.23, 0.9
        cr.rectangle 10, 15, 90, 60
        cr.fill

        cr.set_source_rgb 0.9, 0.1, 0.1
        cr.rectangle 130, 15, 90, 60
        cr.fill

        cr.set_source_rgb 0.4, 0.9, 0.4
        cr.rectangle 250, 15, 90, 60
        cr.fill
      end
    end

    #--------------------
    def show_graphically
      Gtk.init
      RubyApp.new
      Gtk.main
    end

    show_graphically
