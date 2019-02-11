def max_sliding_window(nums, k)
  result = []
  sliding_queue = []

  nums.each_with_index do |num, index|
    if sliding_queue.any? && sliding_queue.first == index - k
      sliding_queue.shift
    end

    while sliding_queue.any? && nums[sliding_queue.last] < num
      sliding_queue.pop
    end

    sliding_queue << index

    if index >= k - 1
      result << nums[sliding_queue.first]
    end
  end

  result
end

puts max_sliding_window([1, 3, -1, -3, 5, 3, 6, 7], 3).inspect
puts max_sliding_window([1, 3, -1, -3, 5, 3, 6, 7], 1).inspect
puts max_sliding_window([1, 3, -1, -3, 5, 3, 6, 7], 8).inspect
