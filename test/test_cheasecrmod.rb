require 'helper'
require 'coderunner'

class TestCheasecrmod < Test::Unit::TestCase
  def setup
    @runner = CodeRunner.fetch_runner(Y: 'test/solovev', C: 'chease', X: '/dev/null')
  end
  def teardown
  end
  def test_basics
    assert_equal(@runner.run_class, CodeRunner::Chease)
  end
  def test_submit
    Dir.chdir('test/solovev'){@runner.run_class.use_new_defaults_file("rake_test", "chease_namelist_EXAMPLE.in")}
    #FileUtils.mv('rake_test_defaults.rb', @runner.run_class.rcp.user_defaults_location)
		if ENV['CHEASE_EXEC']
      CodeRunner.submit(Y: 'test/solovev', p: '{ap: [0.3,0.5,0.4,0.0,0.4,0.0,0.0], at: [0.16,1.0,1.0,-1.1,-1.1]}',  T: false, D: 'rake_test', n: '1', X: ENV['CHEASE_EXEC'])
      CodeRunner.submit(Y: 'test/solovev', p: '{restart_id: 1, nblopt: 1}',  T: false, D: 'rake_test', n: '1', X: ENV['CHEASE_EXEC'])
    FileUtils.rm(@runner.run_class.rcp.user_defaults_location + '/rake_test_defaults.rb')
    FileUtils.rm('test/solovev/rake_test_defaults.rb')
		FileUtils.rm_r('test/solovev/v')
		end
      #CodeRunner.submit(Y: 'test/ifspppl', T: false, D: 'rake_test', n: '1', X: ENV['TRINITY_EXEC'], p: '{restart_id: 1}')
			#Dir.chdir('test/ifspppl') do
				#system "ls v/id_2/"
				##system "less v/id_2/#{@runner.run_list[2].error_file}"
			#end
			##@runner.update
			##CodeRunner.status(Y: 'test/ifspppl')
			##STDIN.gets
			#assert_equal(:Complete, @runner.run_list[1].status)
			#assert_equal(:Complete, @runner.run_list[2].status)
			#assert_equal(@runner.run_list[1].list(:t).values.max, @runner.run_list[2].list(:t).values.min)
		#else
      #CodeRunner.submit(Y: 'test/ifspppl', T: true, D: 'rake_test')
		#end
		#base_hash = @runner.run_class.parse_input_file('test/ifspppl/test.trin')
		#test_hash = @runner.run_class.parse_input_file('test/ifspppl/v/id_1/v_id_1_t.trin')
		#assert_equal(base_hash, test_hash)
		#CodeRunner.status(Y: 'test/ifspppl')
  end
  def teardown
    FileUtils.rm('test/solovev/.code_runner_script_defaults.rb')
    FileUtils.rm('test/solovev/.CODE_RUNNER_TEMP_RUN_LIST_CACHE')
  end
end
