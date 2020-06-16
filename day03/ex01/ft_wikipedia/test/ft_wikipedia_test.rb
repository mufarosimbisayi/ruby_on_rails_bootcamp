require_relative "test_helper"

class FtWikipediaTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FtWikipedia::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_main_features
    ft_wikipedia = Ft_wikipedia.new
    assert_kind_of(Ft_wikipedia, ft_wikipedia, "Returns Ft_wikipedia object")
    loop_result = ft_wikipedia.search("Kiss")
    assert_equal(loop_result, "Found loop", "Identifies loops")
  end
end
