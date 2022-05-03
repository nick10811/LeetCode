import Foundation

class Solution {
    func canThreePartsEqualSum(_ arr: [Int]) -> Bool {
        var sum = 0
        arr.forEach{ sum += $0 }
        
        guard sum % 3 == 0 else { return false }
        sum /= 3
        
        var i = 0, j = 0
        var sum0 = 0, sum1 = 0, sum2 = 0
        for index in 0..<arr.count-2 {
            sum0 += arr[index]
            if sum0 == sum {
                i = index
                break
            }
        }
        
        for index in i+1..<arr.count-1 {
            sum1 += arr[index]
            if sum1 == sum {
                j = index
                break
            }
        }
        
        for index in j+1..<arr.count {
            sum2 += arr[index]
        }
        
        return sum == sum0 && sum == sum1 && sum == sum2
    }
}

let sol = Solution()
print(sol.canThreePartsEqualSum([3,3,3]))
print(sol.canThreePartsEqualSum([0,2,1,-6,6,-7,9,1,2,0,1]))
print(sol.canThreePartsEqualSum([0,2,1,-6,6,7,9,-1,2,0,1]))
print(sol.canThreePartsEqualSum([3,3,6,5,-2,2,5,1,-9,4]))
print(sol.canThreePartsEqualSum([1,-1,1,-1]))
