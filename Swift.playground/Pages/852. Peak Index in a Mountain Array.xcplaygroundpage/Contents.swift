import Foundation

class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        for i in 0..<arr.count-1 {
            if arr[i] > arr[i+1] {
                return i
            }
        }
        return 0
    }
}

let sol = Solution()
print(sol.peakIndexInMountainArray([0,1,0]))
print(sol.peakIndexInMountainArray([0,2,1,0]))
print(sol.peakIndexInMountainArray([0,10,5,2]))
