# encoding: UTF-8

=begin    
    二分查找
    前提：有序数组
    O(f(n)) = logn
思路：
    在已有序数组中查找，每次去该数组最中间位置的那个值，将它与目标值比对。
        if key < orderly_array[middle]
            high = middle - 1
        else if key > orderly_array[middle]
            low = middle + 1
        else
            return middle
=end

# orderly_array 有序数组
# key           要查找的值
# [return] 目标的位置或nil
def binarySearch(orderly_array, key)
    low = 0
    high = orderly_array.length-1
    while (low <= high)
        middle = (low + high)/2

        if key < orderly_array[middle]
            high = middle - 1
        elsif key > orderly_array[middle]
            low = middle + 1
        else
            return middle
        end
    end
    nil
end

orderly_array = [1,2,3,4,5]
key = 7
postion = binarySearch(orderly_array, key)
puts postion ||= 'can not found'