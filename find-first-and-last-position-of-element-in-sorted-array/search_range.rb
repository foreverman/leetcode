def binary_search_last(nums, target, left)
  low = 0
  high = nums.length - 1
  index_found = -1

  while low <= high
    mid = (low + high) / 2

    if nums[mid] == target
      index_found = mid
    end

    if nums[mid] > target || (left && nums[mid] == target)
      high = mid - 1
    else
      low = mid + 1
    end
  end
  index_found
end

def search_range(nums, target)
  low = 0 
  high = nums.length - 1
  index = -1

  while low <= high
    mid = (low + high) / 2

    if nums[mid] == target
      index = mid
      break
    end

    if nums[mid] > target
      high = mid - 1
    end

    if nums[mid] < target
      low = mid + 1
    end
  end

  if index != -1
    left_index = binary_search_left(nums, target, low, index - 1)
    right_index = binary_search_right(nums, target, index + 1, high)
    if left_index == -1
      left_index = index
    end

    if right_index == -1
      right_index = index
    end
    [left_index, right_index]
  else
    [-1, -1]
  end
end

def binary_search_left(nums, target, low, high)
  last_found_index = -1
  while low <= high
    mid = (low + high) / 2
    if nums[mid] != target
      low = mid + 1
    else
      last_found_index = mid
      high = mid - 1
    end
  end
  last_found_index
end

def binary_search_right(nums, target, low, high)
  last_found_index = -1
  while low <= high
    mid = (low + high) / 2
    if nums[mid] > target
      high = mid - 1
    end

    if nums[mid] < target
      low = mid + 1
    end

    if nums[mid] == target
      last_found_index = mid
      low = mid + 1
    end
  end
  last_found_index
end

def search_range(nums, target)
  left_index = -1
  right_index = -1

  (0...nums.length).each do |index|
    if nums[index] == target
      left_index = index
      break
    end
  end

  if left_index != -1
    (nums.length - 1).downto(0).each do |index|
      if nums[index] == target
        right_index = index
        break
      end
    end
  end

  [left_index, right_index]
end

def search_range(nums, target)
  left_index = binary_search_last(nums, target, true)
  right_index = -1
  if left_index != -1
    right_index = binary_search_last(nums, target, false)
  end
  [left_index, right_index]
end

puts search_range([5, 7, 7, 8, 8, 10], 8).inspect
puts search_range([5, 7, 7, 8, 8, 10], 6).inspect 
puts search_range([1], 1).inspect 
puts search_range([], 1).inspect 
puts search_range([1, 3, 5, 5, 5, 5, 7, 123, 125], 7).inspect 
