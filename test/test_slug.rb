require 'minitest_helper'

class TestSlug < MiniTest::Unit::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Slug::VERSION
  end
end
