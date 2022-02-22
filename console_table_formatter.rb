class ConsoleTableFormatter
  attr_accessor :total_func
  
  private
  def initialize(cols)
    # cols: text, width, align[:left, :right, :center]
    @cols = cols
    @total_func = nil
  end
  def strfmt(text, width, align)
    ftext = text.strip
    padding_len = ftext.length < width ? width - ftext.length : 0
    
    if align == :center
      padlen_rgt = (padding_len / 2).to_i
      padlen_lft = padding_len - padlen_rgt
      "#{" " * padlen_lft}#{ftext[0, width]}#{" " * padlen_rgt}"
    else
      padding = " " * padding_len
      if align == :right
        "#{padding}#{ftext[0, width]}"
      else
        "#{ftext[0, width]}#{padding}"
      end
    end
  end
  
  public
  def format(data)
    total_col_width = @cols.map{|c|c["width"]}.sum
    columns = @cols.map{|c|strfmt(c["text"], c["width"], c["align"])}
    num_cols = (0...columns.count)
    vlinesep = "=" * total_col_width
    
    puts vlinesep
    puts columns.join
    puts vlinesep
    data.each do |d|
      lines = num_cols.map{|c|strfmt("#{d[c]}", @cols[c]["width"], @cols[c]["align"])}
      puts lines.join
    end
    puts vlinesep
    
    if !@total_func.nil?
      total = @total_func.call
      lines = num_cols.map{|c|strfmt("#{total[c]}", @cols[c]["width"], @cols[c]["align"])}
      puts lines.join
      puts vlinesep
    end
  end
end
