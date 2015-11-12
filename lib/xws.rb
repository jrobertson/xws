#!/usr/bin/env ruby

# file: xws.rb

require 'rexle'


class XWS

  def initialize(ignore_elements: %i(pre code time))

    @ignore_elements = ignore_elements
    @ignorewords = %i(the and or)
  end

  def scan(node)

    a = []

    node.each_recursive do |x|

      if not x.name[/#{@ignore_elements.join('|')}/] then
        a += x.texts.map(&:strip).select{|x| not x.empty?}
      end
    end

    words(a.join(' ')).split.group_by(&:to_s).\
                               inject({}){|r, x| r.merge(x[0] => x[-1].length)}

  end

  def words(s)

    s.downcase. 
      gsub(/\w+'\w+/,'').  # remove words containing an apostrophe
      gsub(/["']/,'').     # remove quotation marks
      gsub(/(\w)[^a-z ]+\B|\B[^a-z #]+(\w)/,'\1\2').     # remove non-alpabetical characters from start or beginning of words
      gsub(/\s.\s/,' ').      # remove single digits 
      gsub(/\b(?:#{@ignorewords.join('|')})\b/,'')
    
  end

end
