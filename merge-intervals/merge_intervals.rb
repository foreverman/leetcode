require 'minitest/autorun'

def merge(intervals)
  intervals.sort_by!(&:first)

  result = []

  intervals.each do |start, ending|
    if result.empty? || result.last[1] < start
      result << [start, ending]
    else
      if ending > result.last[1]
        result.last[1] = ending
      end
    end
  end
  result
end

class MergeIntervalsTest < Minitest::Test
  def test_merge_normal
    intervals = [[1,3],[2,6],[8,10],[15,18]]
    assert_equal [[1, 6], [8, 10], [15, 18]], merge(intervals)

    intervals = [[1,3],[2,6],[5,10],[15,18]]
    assert_equal [[1, 10], [15, 18]], merge(intervals)

    intervals = [[1, 4], [4, 5]]
    assert_equal [[1, 5]], merge(intervals)


    intervals = [[1, 4],[0, 1]]
    assert_equal [[0, 4]], merge(intervals)

    intervals = [[1, 4],[0, 0]]
    assert_equal [[0, 0], [1, 4]], merge(intervals)
  end

  def test_merge_one_interval
    intervals = [[1,3]]
    assert_equal [[1, 3]], merge(intervals)
  end
end
