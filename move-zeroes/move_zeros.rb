require 'minitest/autorun'

def move_zeros_right(nums)
  zero_index = nil
  nums.each_with_index do |num, index|
    if num.zero?
      zero_index = index unless zero_index
    else
      next if zero_index.nil?
      nums[zero_index], nums[index] = nums[index], nums[zero_index]
      zero_index += 1
    end
  end
end

def move_zeros_right(nums)
  non_zero_at = 0

  nums.each_with_index do |num, index|
    if num != 0
      nums[non_zero_at], nums[index] = nums[index], nums[non_zero_at]
      non_zero_at += 1
    end
  end
end

def move_zeros_left(nums)
  zero_at = nil

  (nums.length - 1).downto(0) do |index|
    if nums[index].zero?
      zero_at ||= index
    else
      next if zero_at.nil?
      nums[zero_at], nums[index] = nums[index], nums[zero_at]
      zero_at -= 1
    end
  end
end

class MoveZerosRightTest < Minitest::Test
  def test_zeros_evently_distributed
    nums = [0, 1, 0, 3, 12]
    move_zeros_right(nums)
    assert_equal [1, 3, 12, 0, 0], nums 
  end

  def test_without_zeros
    nums = [1, 2, 3]
    move_zeros_right(nums)
    assert_equal [1, 2, 3], nums 
  end

  def test_all_zeros
    nums = [0, 0, 0]
    move_zeros_right(nums)
    assert_equal [0, 0, 0], nums 
  end

  def test_all_right_zeros
    nums = [1, 2, 3, 0, 0, 0]
    move_zeros_right(nums)
    assert_equal [1, 2, 3, 0, 0, 0], nums 
  end

  def test_all_left_zeros
    nums = [0, 0, 0, 1, 2, 3]
    move_zeros_right(nums)
    assert_equal [1, 2, 3, 0, 0, 0], nums 
  end

  def test_empty_array
    nums = []
    move_zeros_right(nums)
    assert_equal [], nums 
  end
end

class MoveZerosLeftTest < Minitest::Test
  def test_zeros_evently_distributed
    nums = [1, 0, 3, 0, 12, 0]
    move_zeros_left(nums)
    assert_equal [0, 0, 0, 1, 3, 12], nums 
  end

  def test_without_zeros
    nums = [1, 2, 3]
    move_zeros_left(nums)
    assert_equal [1, 2, 3], nums 
  end

  def test_all_right_zeros
    nums = [1, 2, 3, 0, 0, 0]
    move_zeros_left(nums)
    assert_equal [0, 0, 0, 1, 2, 3], nums 
  end

  def test_all_left_zeros
    nums = [0, 0, 0, 1, 2, 3]
    move_zeros_left(nums)
    assert_equal [0, 0, 0, 1, 2, 3], nums 
  end

  def test_all_zeros
    nums = [0, 0, 0]
    move_zeros_left(nums)
    assert_equal [0, 0, 0], nums 
  end

  def test_empty_array
    nums = []
    move_zeros_left(nums)
    assert_equal [], nums 
  end
end
