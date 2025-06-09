class Solution(object):
    def checkInclusion(self, s1, s2):
        """
        :type s1: str
        :type s2: str
        :rtype: bool
        """
        s1_len = len(s1)
        s1_cnt = {}

        for i in s1:
            s1_cnt[i] = 1 + s1_cnt.get(i, 0)

        s2_cnt = {}
        l = 0
        r = l + s1_len

        while r <= len(s2):
            s2_cnt = {}
            for i in s2[l:r]:
                s2_cnt[i] = 1 + s2_cnt.get(i, 0)


            if s1_cnt == s2_cnt:
                return True

            l += 1
            r = l + s1_len

        return False
            
