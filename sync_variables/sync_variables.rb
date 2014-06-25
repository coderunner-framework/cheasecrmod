
require 'helper'
CodeRunner.setup_run_class('chease')
#CodeRunner::Chease.get_input_help_from_source_code(ENV['CHEASE_SOURCE'])
#CodeRunner::Chease.update_defaults_from_source_code(ENV['CHEASE_SOURCE'])
CodeRunner::Chease.synchronise_variables(ENV['CHEASE_SOURCE'])
