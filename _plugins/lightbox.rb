class LightboxTag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      @input = input
    end

    def render(context)
      id, src, thumb = @input.split("|").collect(&:strip)

      <<-EOF
<div class='lightbox' id='#{id}'>
  <a href="#_" class="btn-close">X</a>
  <img src="/img/#{src}">
</div>

<a href="##{id}">
  <img class="thumb" src="/img/#{thumb || src}">
</a>
      EOF
    end
end

class LightboxesTag < Liquid::Tag
  def initialize(tag_name, input, tokens)
    super
    @input = input
  end

  def render(context)
    boxes = @input.split(";").collect(&:strip)
    output = ""
    ids = []
    sources = []
    thumbs = []

    boxes.each do |box|
      id, source, thumb = box.split("|").collect(&:strip)
      ids << id
      sources << source
      thumbs << thumb
    end

    0.upto(boxes.size - 1) do |i|
      output += <<-EOF
<div class='lightbox' id='#{ids[i]}'>
<a href="#_" class="btn-close">X</a>
<img src="/img/#{sources[i]}">
</div>
EOF
    end

    0.upto(boxes.size - 1) do |i|
      output += <<-EOF
<a href="##{ids[i]}">
<img class="thumb" src="/img/#{thumbs[i]}">
</a>
EOF
    end

    output
  end
end

Liquid::Template.register_tag('lightbox', LightboxTag)
Liquid::Template.register_tag('lightboxes', LightboxesTag)