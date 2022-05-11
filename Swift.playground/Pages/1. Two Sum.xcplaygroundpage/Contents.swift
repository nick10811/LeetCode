import Foundation

class Solution {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        for i in 0..<nums.count {
//            for j in i+1..<nums.count {
//                if nums[j] == target - nums[i] {
//                    return [i, j]
//                }
//            }
//        }
//        return []
//    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // make a hash map
        var hashMap = [Int:Int]() // Dictionary (index, num)
        for i in 0..<nums.count {
            let num = nums[i]
            if let dic = hashMap.first(where: { $0.value == target - num }) {
                return [dic.key, i]
            }
            hashMap[i] = num
        }
        return []
    }
}

let sol = Solution()
print(sol.twoSum([2,7,11,15], 9)) // 2 + 7 = 9
print(sol.twoSum([3,2,4], 6)) // 2 + 4 = 6
print(sol.twoSum([3,3], 6)) // 3 + 3 = 6
