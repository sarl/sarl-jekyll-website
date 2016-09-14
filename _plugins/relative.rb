class Jekyll::Page

  def relative
    count = url.split("/").length
    #puts "INPUT=%s" % url
    if url == "/"
      ""
    elsif url.end_with? "/"  # /about/history/ -- gives us ["","about","history"]
      "../" * (count-1)
    else                     # /about/history.html -- gives us ["","about","history.html"]
      "../" * (count-2)
    end
  end

  def to_liquid(attrs = ATTRIBUTES_FOR_LIQUID)
    super(attrs + %w[
          relative
    ])

  end
end

class Jekyll::Post

  def relative
    count = url.split("/").length
    if url == "/"
      ""
    elsif url.end_with? "/"  # /about/history/ -- gives us ["","about","history"]
      "../" * (count-1)
    else                     # /about/history.html -- gives us ["","about","history.html"]
      "../" * (count-2)
    end
  end

  def to_liquid(attrs = ATTRIBUTES_FOR_LIQUID)
    super(attrs + %w[
          relative
    ])
	puts attrs.inspect

  end
end
