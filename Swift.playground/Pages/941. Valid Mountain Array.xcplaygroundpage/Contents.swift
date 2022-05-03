import Foundation

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        var walk = 0
        
        // up count
        while walk+1 < arr.count && arr[walk] < arr[walk+1] {
            walk += 1
        }
        
        // peak can't be first or last
        if walk == 0 || walk == arr.count-1 {
            return false
        }
        
        // down count
        while walk+1 < arr.count && arr[walk] > arr[walk+1] {
            walk += 1
        }
        
        return walk == arr.count-1
    }
}

let sol = Solution()
print(sol.validMountainArray([1,2]))
print(sol.validMountainArray([2,1]))
print(sol.validMountainArray([3,5,5]))
print(sol.validMountainArray([0,3,2,1]))
print(sol.validMountainArray([0,2,3,4,5,2,1,0]))
print(sol.validMountainArray([0,2,3,3,5,2,1,0]))
print(sol.validMountainArray([2,0,2]))
print(sol.validMountainArray([1,2,0,2]))
