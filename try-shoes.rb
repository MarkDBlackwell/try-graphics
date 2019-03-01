    require_relative 'integer-rescaler.rb'
    require_relative 'graphics.rb'

    include Graphics

    XI,YI = [0,1]
    SIZE = 950

    def show_graphics
      Shoes.app :title => "#{ARGV.at 0} - longest increasing subsequence" do
        stack do
          image SIZE, SIZE do
            VECTORS.each{|e| e.length.times{|i| line *(e.at i)}}
          end
        end
      end
    end

    sequences=[[[15,16],[39,47],[44,68],[65,97],[72,103],[90,163],[102,167],[123,237],[191,249]].sort.uniq]

    #print 'sequences.inspect=';p sequences.inspect
    first_and_last = sequences.map{|e| [e.first, e.last]}.flatten 1
    #print 'first_and_last.inspect=';p first_and_last.inspect

    xr = IntegerRescaler.new first_and_last.map{|e|(e.at XI)}, 0, SIZE
    yr = IntegerRescaler.new first_and_last.map{|e|(e.at YI)}, SIZE, 0

    scaled_sequences = sequences.map do |q|
      q.map{|e| [ xr.rescale(e.at XI), yr.rescale(e.at YI) ]}
    end
    #print 'scaled_sequences.inspect=';p scaled_sequences.inspect

    line_segments = scaled_sequences2line_segments scaled_sequences
    #print 'line_segments.inspect=';p line_segments.inspect

    if defined? Shoes
      VECTORS = [line_segments]
      show_graphics
    end
