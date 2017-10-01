# Module that can be included (mixin) to take and output Yaml data
require 'yaml'

module YamlBuddy
  # take_yml: converts a yaml file into tsv string
  # parameter: yaml
  def take_yaml(yml)
    yaml_file = YAML.load_file(yml)
    first_hash = yaml_file[0]
    keys = first_hash.key
    @data = ""
    keys.each{ |key| @data.concat(key + "\t") }
    @data << "\n"
    @data
  end


  # to_yaml: converts tsv into yaml
  # return: yaml(@data)
  def to_yaml
    return @data.to_yaml
  end
end
