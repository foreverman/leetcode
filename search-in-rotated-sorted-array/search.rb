 def search(nums, target)
  pivot_index = find_pivot(nums)
  if pivot_index 
    if nums[0] <= target
      binary_search(nums, 0, pivot_index, target)
    else
      binary_search(nums, pivot_index + 1, nums.length - 1, target)
    end
  else
    binary_search(nums, 0, nums.length - 1, target)
  end
end

def binary_search(nums, low, high, target)
  while low <= high
    mid = (low + high) / 2
    if target == nums[mid]
      return mid
    end

    if target < nums[mid]
      high = mid - 1
    end

    if target > nums[mid]
      low = mid + 1
    end
  end

  -1
end

def find_pivot(nums)
  if nums.length <= 1 || nums.last > nums.first
    return nil
  end

  low = 0
  high = nums.length - 1

  while low <= high
    mid = (high + low) / 2

    # is the item before mid pivot?
    if nums[mid - 1] > nums[mid]
      return mid - 1
    end

    # is the item after mid pivot?
    if nums[mid] > nums[mid + 1]
      return mid
    end

    if nums[low] > nums[mid]
      high = mid - 1
    else
      low = mid + 1
    end
  end
end
# puts search([1, 2, 4, 5, 6, 7, 0], 4)
# puts search([1, 2, 4, 5, 6, 7, 0], 0)
# puts search([1, 2, 4, 5, 6, 7, 0], 3)
# puts find_pivot([2, 4, 5, 6, 7, 0, 1])
# puts search([4, 5, 6, 7, 0, 1, 2], 5)
# puts find_pivot([5, 6, 7, 0, 1, 2, 4])
# puts find_pivot([6, 7, 0, 1, 2, 4, 5])
# puts search([7, 0, 1, 2, 4, 5, 6], 4)
# puts search([7, 0, 1, 2, 4, 5, 6], 8)
# puts search([], 1)
# puts search([1, 2], 2)
# puts search([1, 2], 3)
puts search([5, 1, 3], 1)
# puts find_pivot([2, 1])
