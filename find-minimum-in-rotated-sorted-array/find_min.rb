def find_min(nums)
  if nums.length <= 1 || nums.last > nums.first
    return nums.first
  end

  low = 0
  high = nums.length - 1

  while low <= high
    mid = (low + high) / 2

    if nums[mid - 1] > nums[mid]
      return nums[mid]
    end

    if nums[mid + 1] < nums[mid]
      return nums[mid + 1]
    end

    if nums[low] > nums[mid]
      high = mid - 1
    else
      low = mid + 1
    end
  end
end

puts find_min([3, 4, 5, 1, 2])
puts find_min([4, 5, 6, 7, 0, 1, 2])
puts find_min([1, 2, 3])
puts find_min([])
