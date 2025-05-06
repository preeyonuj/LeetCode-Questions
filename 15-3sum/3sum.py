class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        res = []
        nums.sort()

        for ind, num in enumerate(nums):
            if ind > 0 and nums[ind - 1] == num:
                continue
            
            l, r = ind + 1, len(nums)-1

            while l < r:
                if nums[l] + nums[r] + num < 0:
                    l += 1
                elif nums[l] + nums[r] + num > 0:
                    r -= 1
                else:
                    res.append([num, nums[l], nums[r]])
                    l += 1
                    while nums[l] == nums[l-1] and l < r:
                        l += 1

        return res