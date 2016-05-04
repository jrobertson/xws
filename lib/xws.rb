#!/usr/bin/env ruby

# file: xws.rb

require 'yawc'
require 'rexle'


class XWS

  def initialize(ignore_elements: %i(pre code time))

    @ignore_elements = ignore_elements

  end

  def scan(node)

    a = []

    node.each_recursive do |x|

      if not x.name[/#{@ignore_elements.join('|')}/] then
        a += x.texts.map(&:strip).select{|x| not x.empty?}
      end
    end

    Yawc.new(a.join(' ')).to_h
    
  end

end