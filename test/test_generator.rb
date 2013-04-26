require 'minitest_helper'

module Slug
  class TestGenerator < MiniTest::Unit::TestCase
    def test_generate_increments_if_slug_already_exists
      slug = Generator.generate 'tim-cooper' do |slug|
        slug == 'tim-cooper'
      end

      assert_equal 'tim-cooper-1', slug
    end

    def test_cannot_start_with_separator
      slug = Generator.generate '-slug'

      assert_equal 'slug', slug
    end

    def test_cannot_end_with_separator
      slug = Generator.generate 'slug-'

      assert_equal 'slug', slug
    end

    def test_cannot_contain_a_double_separator
      slug = Generator.generate 'slug--ish'

      assert_equal 'slug-ish', slug
    end

    def test_cannot_contain_invalid_characters
      slug = Generator.generate 'slug !@#$%^&*()<>;/? ish'

      assert_equal 'slug-ish', slug
    end

    def test_can_contain_numbers_and_letters
      slug = Generator.generate 'slug 123'

      assert_equal 'slug-123', slug
    end
  end
end
