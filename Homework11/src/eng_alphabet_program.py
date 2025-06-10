# Alphabet base class
class Alphabet:
    def __init__(self, lang, letters):
        self.lang = lang
        self.letters = letters

    def print(self):
        print("Letters of the alphabet:", self.letters)

    def letters_num(self):
        return len(self.letters)


# English alphabet class
class EngAlphabet(Alphabet):
    _letters_num = 26  # private static attribute

    def __init__(self):

        super().__init__("En", [chr(i) for i in range(ord('A'), ord('Z') + 1)])

    def is_en_letter(self, letter):
        return letter.upper() in self.letters

    def letters_num(self):
        return EngAlphabet._letters_num

    @staticmethod
    def example():
        return "My name is Dmitry. I am 38 years old."


# Main part (testing)
if __name__ == "__main__":
    # Creating an English alphabet object
    eng_alphabet = EngAlphabet()

    # Output of letters of the alphabet
    eng_alphabet.print()

    # Number of letters
    print("Number of letters:", eng_alphabet.letters_num())

    # Checking if 'F' is an English letter
    print("Is 'F' an English letter?", eng_alphabet.is_en_letter('F'))

    # Checking if 'Щ' is an English letter
    print("Is 'Щ' an English letter?", eng_alphabet.is_en_letter('Щ'))

    # Example of an English sentence
    print("Example of English text:", EngAlphabet.example())
