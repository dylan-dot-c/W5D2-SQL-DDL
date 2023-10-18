import re

def solution(string):
    x = re.findall('[a-zA-z][a-z]*', string)
    return ' '.join(x)

print(solution("helloWorldICanCode"))