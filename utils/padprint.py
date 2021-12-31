import sys
import re

padding = int(sys.argv[1])
file1 = open(sys.argv[2]).read()
file2 = open(sys.argv[3]).read()

file1_lines = file1.split('\n')
file2_lines = file2.split('\n')

max_length = max(len(file1_lines), len(file2_lines))

for x in range(0, max_length):
    try:
        current_line = file1_lines[x]
    except:
        current_line = ''

    try:
        column2 = file2_lines[x]
    except:
        column2 = ''

    ansi_escape = re.compile(r'''
        \x1B  # ESC
        (?:   # 7-bit C1 Fe (except CSI)
            [@-Z\\-_]
        |     # or [ for CSI, followed by a control sequence
            \[
            [0-?]*  # Parameter bytes
            [ -/]*  # Intermediate bytes
            [@-~]   # Final byte
        )
    ''', re.VERBOSE)
    actual_length = ansi_escape.sub('', current_line)

    line_padding = padding - len(actual_length)
    if line_padding > 0:
        current_line += ' ' * line_padding

    print(current_line + column2)
