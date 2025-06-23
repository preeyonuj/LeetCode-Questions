class Solution(object):
    def minWindow(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: str
        """

        if t == "":
            return ""

        T_dict, window = {}, {}

        for char in t:
            T_dict[char] = 1 + T_dict.get(char, 0)


        have, need = 0, len(T_dict)
        res, reslen = [-1, -1], float("infinity")
        l = 0

        for r in range(len(s)):
            c = s[r]
            window[c] = 1 + window.get(c, 0)

            if c in T_dict and window[c] == T_dict[c]:
                have += 1

            while have == need:
                if (r - l + 1) < reslen:
                    res = [l , r]
                    reslen = r - l + 1

                window[s[l]] -= 1
                if s[l] in T_dict and window[s[l]] < T_dict[s[l]]:
                    have -= 1

                l += 1

        l, r = res
        return s[l:r+1] if reslen != float("infinity") else ""


        