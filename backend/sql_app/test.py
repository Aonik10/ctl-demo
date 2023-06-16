import re

password_pattern = "^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$"
cond = re.match(password_pattern, 'secretO') # Returns None
cond2 = re.match(password_pattern, '-Secr3t.') # Returns Match object


if cond2:
    print("hola")

if cond:
    print("hola")