class Token:
    def __init__(self, Type, value):
        self.Type = Type
        self.value = value

    def _str_(self):
        return "TOKEN: {}. VALUE: {}".format(self.Type, self.value)
    
    def _repr_(self):
        print self._str_

def main():
    c = Token(INTEGER, 3)
    c._repr_()

if __name__ == "__main__":
    main()
