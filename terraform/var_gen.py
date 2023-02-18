from sys import argv
import re

# takes all args as files to search across
files = argv[1:]

# matches things like 'var.blah' or 'var.blah_blah_blah'
pattern = re.compile('var\.[a-z,_]+')

# ensures unique values
variable_set = set()

for f in files:
    with open(f, 'r') as file:
        lines = file.readlines()

        for l in lines:
            # using p.search ensures we're looking everywhere in the line
            match = pattern.search(l)

            if match:
                # match.group(0) will equal i.e. 'var.blah', we want 'blah'
                name = match.group(0).split('.')[1]
                variable_set.add(name)

# sort our result
variable_list = sorted(list(variable_set))

# writes to variables.tf.gen
with open('variables.tf.gen', 'w') as var_file:
    for v in variable_list:
        var_file.write(f"variable \"{v}\" {{}}\n\n")
