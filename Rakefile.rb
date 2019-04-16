#chamada para rodar os testes de API
@success = true
desc 'Task to run POST API Testing'
task :post_api do
  puts 'Running POST API Testing'
  sh 'rspec post.rb'
end

desc 'Task to run PUT API Testing'
task :put_api do
    puts 'Running PUT API Testing'
    sh 'rspec put.rb'
end

desc 'Task to run GET API Testing'
task :get_api do
    puts 'Running GET API Testing'
    sh 'rspec get.rb'
end

desc 'Task to run DELETE API Testing'
task :get_api do
    puts 'Running GET API Testing'
    sh 'rspec delete.rb'
end

desc 'Task to run ALL API Testing with report'
task :generate_report do
    puts 'Running API Testing'
    sh 'rspec *.rb -f RspecHtmlFormatter spec'
end


raise StandardError, "Tests failed!" unless @success

