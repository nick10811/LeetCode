import Foundation

class Solution {
    // time complexity: O(n^2)
//    func findDuplicate(_ nums: [Int]) -> Int {
//        var map = [Int:Int]()
//        for i in 0..<nums.count {
//            let num = nums[i]
//            if map.contains { $0.key == num } {
//                return num
//            } else {
//                map[num] = 1
//            }
//        }
//        return -1
//    }
    
    // optimize algorithmn
    // time complexity: O(2n)
    func findDuplicate(_ nums: [Int]) -> Int {
        // sorting
        let sorted = nums.sorted()
        // compare two neighbor
        for i in 1..<sorted.count {
            if sorted[i] == sorted[i-1] {
                return sorted[i]
            }
        }
        return -1
    }
}

let sol = Solution()
print(sol.findDuplicate([1,3,4,2,2]))
print(sol.findDuplicate([3,1,3,4,2]))
print(sol.findDuplicate([7,9,7,4,2,8,7,7,1,5]))
