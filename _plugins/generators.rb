module Jekyll

  class PhotoPage < Page
    def initialize(site, base, dir, slug, image_url, title)
      @site = site
      @base = base
      @dir = dir
      @slug = slug
      @name = slug + '.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'photo.html')
      self.data['title'] = title
      self.data['image_url'] = image_url
    end
  end

  class PhotoPageGenerator < Generator
    safe true

    def generate(site)
      site.data['photos'].each do |photo|
        site.pages << PhotoPage.new(site, site.source, 'photos', photo['slug'], photo['url'], photo['title'])
      end
    end
  end

end