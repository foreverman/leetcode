require 'minitest/autorun'
require_relative 'rotate'

class RotateTest < Minitest::Test
  def setup
    @array = [1, 2, 3, 4, 5, 6, 7]
  end

  def test_rotate_3_steps
    rotate(@array, 3)
    assert_equal [5, 6, 7, 1, 2, 3, 4], @array
  end

  def test_rotate_2_steps
    rotate(@array, 2)
    assert_equal [6, 7, 1, 2, 3, 4, 5], @array
  end

  def test_rotate_1_step
    rotate(@array, 1)
    assert_equal [7, 1, 2, 3, 4, 5, 6], @array
  end

  def test_rotate_7_step
    rotate(@array, 7)
    assert_equal [1, 2, 3, 4, 5, 6, 7], @array
  end

  def test_rotate_8_step
    rotate(@array, 8)
    assert_equal [7, 1, 2, 3, 4, 5, 6], @array
  end

  def test_rotate_empty_array
    array = []
    rotate(array, 1)
    assert_equal [], array
  end

  def test_rotate_array_with_one_element
    array = [1]
    rotate(array, 1)
    assert_equal [1], array
  end
end
