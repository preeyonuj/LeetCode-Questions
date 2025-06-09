class Solution(object):
    def checkInclusion(self, s1, s2):
        """
        :type s1: str
        :type s2: str
        :rtype: bool
        """
        s1_len = len(s1)

        for l in range(len(s2) - s1_len + 1):
            # print(sorted(s2[l:l+s1_len]))
            # print(sorted(s1))
            if sorted(s2[l:l+s1_len]) == sorted(s1):
                return True

        return False
