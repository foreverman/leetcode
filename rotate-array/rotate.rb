# def rotate(nums, k)
#   return nums if nums.size <= 1
#   (k % nums.length).times { nums.unshift(nums.pop) }
# end

def rotate(nums, k)
  temp_nums = []
  nums.each_with_index do |num, index|
    temp_nums[(index + k) % nums.length] = num
  end
  0.upto(nums.length - 1) do |index|
    nums[index] = temp_nums[index]
  end
end

def rotate(nums, k)
  return nums if nums.size <= 1

  k = k % nums.length 
  return nums if k == 0

  j = nums.length - k
  0.upto(nums.length - 2) do |i|
    if j > nums.length - 1
      j = nums.length - k
    end
    nums[i], nums[j] = nums[j], nums[i]
    j += 1
  end
end
