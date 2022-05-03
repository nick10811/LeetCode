import Foundation

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var index1 = 0, index2 = 0
        var mergedArray: [Int] = []
        for i in 0..<nums1.count {
            if i < m {
                mergedArray.append(nums1[index1])
                index1 += 1
            } else {
                mergedArray.append(nums2[index2])
                index2 += 1
            }
        }
        
        for i in 0..<mergedArray.count {
            nums1[i] = mergedArray[i]
        }
        nums1.sort()
    }
}

let sol = Solution()
var nums1 = [1,2,3,0,0,0]
sol.merge(&nums1, 3, [2,5,6], 3)
print(nums1)
