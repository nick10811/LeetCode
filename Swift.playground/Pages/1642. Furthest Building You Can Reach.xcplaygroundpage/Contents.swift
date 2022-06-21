import Foundation

class Solution {
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        return max(ladddersFirst(heights, bricks, ladders), bricksFrist(heights, bricks, ladders))
    }
    
    func ladddersFirst(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        guard heights.count > 1 else { return 0 }
        
        var bricksCount = bricks
        var laddersCount = ladders
        
        for i in 0..<heights.count-1 {
            let currentHeight = heights[i]
            let nextHeight = heights[i+1]
            
            if nextHeight > currentHeight {
                let diff = nextHeight - currentHeight
                if laddersCount > 0 {
                    laddersCount -= 1
                } else if bricksCount >= diff {
                    bricksCount -= diff
                } else {
                    return i
                }
            } else {
                continue
            }
            
            
        }
        
        return heights.count-1
    }
    
    func bricksFrist(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        guard heights.count > 1 else { return 0 }
        
        var bricksCount = bricks
        var laddersCount = ladders
        
        for i in 0..<heights.count-1 {
            let currentHeight = heights[i]
            let nextHeight = heights[i+1]
            
            if nextHeight > currentHeight {
                let diff = nextHeight - currentHeight
                if bricksCount >= diff {
                    bricksCount -= diff
                } else if laddersCount > 0 {
                    laddersCount -= 1
                } else {
                    return i
                }
                
            } else {
                continue
            }
            
            
        }
        
        return heights.count-1
    }
}

let sol = Solution()
print(sol.furthestBuilding([4,2,7,6,9,14,12], 5, 1)) // 4
print(sol.furthestBuilding([4,12,2,7,3,18,20,3,19], 10, 2)) // 7
print(sol.furthestBuilding([14,3,19,3], 17, 0)) // 3
print(sol.furthestBuilding([1,5,1,2,3,4,10000], 4, 1)) // 5
