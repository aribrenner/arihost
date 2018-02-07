# http://yizeng.me/2017/05/20/add-typescript-support-to-ruby-on-rails-a-quick-and-hacky-example/
namespace :assets do
  desc 'Compile TypeScript Files'
  task :tsc do
    system('node_modules/.bin/tsc')
  end
end

Rake::Task['assets:precompile'].enhance ['assets:tsc']
