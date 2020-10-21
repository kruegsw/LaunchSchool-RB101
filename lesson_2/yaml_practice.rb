require 'yaml'

MESSAGES = YAML.load_file('yaml_practice.yml')

p MESSAGES['chicken']