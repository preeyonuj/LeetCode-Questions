class Solution:
    def maxArea(self, height: List[int]) -> int:
        maxWater = 0

        l, r = 0, len(height) - 1
        c = 0

        while l < r:
            waterQuantity = (r - l) * min(height[l], height[r])
            print(l, r, waterQuantity)
            if waterQuantity > maxWater:
                maxWater = waterQuantity

            if height[l] > height[r]:
                r -= 1
            elif height[l] < height[r]:
                l += 1
            else:
                r -= 1

        return maxWater
        