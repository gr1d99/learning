"""Understanding Python closures"""

VOWELS = ['a', 'e', 'i', 'o', 'u']


def can_work(word):
    """
    checks if word can be plurarized by adding an 's'
    :param word: string to be inspected
    :return: bool
    """

    return False if word[-1] in VOWELS else True


def pluralize(word):
    """
    adds 's' to the provided string if it matches criteria
    :param word: string to be pluralized
    :return: string
    """

    _word = word

    def call():
        """
        modifies provided string
        :return: string
        """
        return _word + 's' if can_work(_word) else word

    return call


print(pluralize('chicken')())
