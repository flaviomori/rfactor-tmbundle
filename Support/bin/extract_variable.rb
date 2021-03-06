require 'rubygems'
require 'rfactor'

# Based on Ruby on Rails bundle
bundle_lib = ENV['TM_BUNDLE_SUPPORT'] + '/lib'
$LOAD_PATH.unshift(bundle_lib) if ENV['TM_BUNDLE_SUPPORT'] and !$LOAD_PATH.include?(bundle_lib)

require 'text_mate'

document = $stdin.read
selected = ENV['TM_SELECTED_TEXT']
line_number = ENV['TM_LINE_NUMBER'].to_i

variable_name = TextMate.input("New variable name:", "new_variable")

code = Rfactor::Code.new(document)
new_code = code.extract_variable :name => variable_name,
    :text => selected,
    :line => line_number

puts "#{new_code}\n"
