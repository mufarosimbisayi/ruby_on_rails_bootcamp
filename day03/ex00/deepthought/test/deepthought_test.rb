require_relative "test_helper"

class DeepthoughtTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Deepthought::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_class_instance
    test_deepthought = Deepthought::Deepthought.new
    assert_instance_of(Deepthought::Deepthought, test_deepthought)
  end

  def test_main_feature
    test_deepthought = Deepthought::Deepthought.new
    expected_output1 = "42"
    expected_output2 = "Mmmm i'm bored"
    question = "The Ultimate Question of Life, the Universe and Everything"
    assert_equal(test_deepthought.respond(question), expected_output1)
    assert_equal(test_deepthought.respond("else"), expected_output2)
  end
end
