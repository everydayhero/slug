require "slug/generator"
require "slug/version"

module Slug
  def self.generate *args, &block
    Generator.generate *args, &block
  end
end

