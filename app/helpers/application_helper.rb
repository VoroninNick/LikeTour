module ApplicationHelper
  def embedded_svg filename, options={}
    embedded_svg_from_abs(Rails.root.join('app', 'assets', 'images', 'svg', filename), options)
  end

  def embedded_svg_from_abs filename, options = {}
    file = File.read(filename)
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  def embedded_svg_from_root_directory filename, options = {}
    embedded_svg_from_abs(Rails.root.join( filename), options)
  end

  def self.embedded_svg_js filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', 'svg', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  def get_category
    @category ||= Category.order(created_at: :asc )
  end

  def get_tags_for_events(cat_name)
    @category = Category.find_by_name(cat_name)
    if @category
      @events = Tour.where(:category => @category.id).includes(:filter_words)

      names = []
      @filter_words = []
      @events.each do |e|
        @filter_words += e.filter_words.select do|f|
          if  !names.include?(f.name)
            names.push(f.name)
            true
          else
            false
          end
        end

      end

      #render inline: "#{@filter_words.class}"
    end
  end


end
