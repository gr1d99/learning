"""
Sample module to demonstrate implementation of OOP properties.

1. Abstraction.
2. Encapsulation.
3. Inheritance.
4. Methods
5. Overloading
"""


class BaseUser(object):
    def __init__(self, first_name, last_name):
        self.first_name = first_name
        self.last_name = last_name

#####################################################
##################INHERITANCE########################


class User(BaseUser):
    """
    Inheritance.

    This class can now access attributes of the base
    class BaseUser.

    usage
    >>> user = User('gideon', 'kimutai')
    >>> print(user.first_name)
    >>> print(user.last_name)
    """


#####################################################
#####################METHODS#########################

class Child(BaseUser):
    """
    This class has one method and it is only accessible
    via its instances.

    usage.
    >>> child = Child('innocent', 'child')
    >>> child.cry()
    aaaaaahhhhhhhhhhhh
    """
    def cry(self):
        """

        :return:
        """
        return 'aaaaaahhhhhhhhhhhh'


####################################################
#################### OVERLOADING####################


class Couple(BaseUser):
    """
    Implement overloading.

    Overload `+` operator so that when adding two
    couples the result will be a statement indicating they
    are married.
    """

    def __add__(self, other):
        man = getattr(self, 'first_name') + getattr(other, 'last_name')
        woman = getattr(self, 'first_name') + getattr(other, 'last_name')
        return woman + ' is married to' + man


####################################################
#################### ENCAPSULATION #################


class Teenager(BaseUser):
    """
    Demonstrate encapsulation.

    That is by using protected and private attributes and methods.

    Usage.
    >>> t = Teenager('Gideon', 'Kim', 22)
    >>> t.teen_info()
    >>> # accessing private attributes will raise an AttributeError
    >>> t.__age
    Traceback (most recent call last):
        File "<input>", line 1, in <module>
    AttributeError: 'Teenager' object has no attribute '__age'
    """

    def __init__(self, first_name, last_name, age):
        """
        Attribute _age can only be accessed via the instances of the class.
        """
        self.__age = age
        super(Teenager, self).__init__(first_name, last_name)

    def teen_info(self):
        print('First Name: %s\nLast Name: %s\nAge: %s' \
               % (self.first_name, self.last_name, self.__age))


####################################################
#################### ABSTRACTION #################


class Gender(BaseUser):
    """
    Demonstrate abstraction by displaying relevant information.

    The instance contains the names of the user when the user
    calls print_gender method. Then only the gender is printed.
    """
    def __init__(self, sex, first_name, last_name):
        self.sex = sex
        super(Gender, self).__init__(first_name, last_name)

    def print_gender(self):
        print(self.sex)
