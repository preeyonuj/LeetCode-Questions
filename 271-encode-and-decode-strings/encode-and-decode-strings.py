class Codec:

    def encode(self, strs):
        """Encodes a list of strings to a single string.
        
        :type strs: List[str]
        :rtype: str
        """
        return "".join([str(len(i))+'#'+i for i in strs])

    def decode(self, s):
        """Decodes a single string to a list of strings.
        
        :type s: str
        :rtype: List[str]
        """
        final = []
        i=0
        while(i <= len(s)-1):
            
            # If digit count is 3 digits
            if s[i].isdigit() and s[i+1].isdigit() and s[i+2].isdigit():
                l = int(s[i]+s[i+1]+s[i+2])
                final.append(s[i+4:i+4+l])
                i = i+4+l
            # If digit count is 2 digits
            elif s[i].isdigit() and s[i+1].isdigit():
                l = int(s[i]+s[i+1])
                final.append(s[i+3:i+3+l])
                i = i+3+l
            # If digit count is 1 digit
            else:    
                l = int(s[i])
                final.append(s[i+2:i+2+l])
                i = i+2+l

        return final        

# Your Codec object will be instantiated and called as such:
# codec = Codec()
# codec.decode(codec.encode(strs))