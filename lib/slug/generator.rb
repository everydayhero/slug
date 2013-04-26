module Slug
  class Generator
    def initialize name, &block
      self.name = name
      @block    = block || ->(_) { false }
      @attempts = 0
    end

    def self.generate *args, &block
      new(*args, &block).generate
    end

    def generate
      while @block.call(current_slug)
        increment_attempts
        self.current_slug = [preferred, @attempts].join '-'
      end

      current_slug
    end

    protected

    attr_writer :current_slug, :preferred

    def current_slug
      @current_slug ||= preferred
    end

    def increment_attempts
      @attempts += 1
    end

    def preferred
      @preferred ||= @name.downcase.gsub(/[^a-z0-9\-]/, '-').gsub(/\-{2,}/, '-').gsub(/^\-|\-$/, '')
    end

    def name= name
      @name = name.to_s
    end
  end
end
