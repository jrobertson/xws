# Introducing the XML Word Scanner (XWS) gem

    require 'xws'
    require 'open-uri'

    url = 'https://www.jamesrobertson.eu/liveblog/2015/nov/10/formatted.xml'
    doc = Rexle.new(open(url).read)
    nodes = doc.root.xpath 'records/section'

    xws = XWS.new
    h = xws.scan nodes[0].element('details')

output (extract):

<pre>
=> {"gas"=>2, "fire"=>2, "is"=>3, "now"=>1, "working"=>2, "again"=>2, 
"#gasfire"=>1, "after"=>1, "drawn"=>1, "out"=>3, "affair"=>1, "of"=>3, 
"attempting"=>1, "to"=>2, "get"=>1, "work"=>1, "it"=>2, "fina...
</pre>

## Resources

* xws https://rubygems.org/gems/xws

xws word scanner xml search
