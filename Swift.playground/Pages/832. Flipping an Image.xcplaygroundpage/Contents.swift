import Foundation

class Solution {
    func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
        var result = image
        
        for i in 0..<image.count {
            let rowCount = image[i].count
            var countDown = rowCount - 1
            for j in 0..<rowCount {
                let element = image[i][countDown]
                result[i][j] = (element + 1) % 2
                countDown -= 1
            }
        }
        return result
    }
}

let sol = Solution()

var arr = [[1,1,0]]
print(sol.flipAndInvertImage(arr))

arr = [[1,1,0],[1,0,1],[0,0,0]]
print(sol.flipAndInvertImage(arr))

arr = [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
print(sol.flipAndInvertImage(arr))
