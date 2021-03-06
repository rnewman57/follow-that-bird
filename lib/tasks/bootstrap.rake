desc "get started"
task :bootstrap => [:environment, 'db:seed']

['database', 'app_config'].each do |config|
  
  file "config/#{config}_example.yml" do |task|
    abort "I don't know what to tell you, dude. There's no #{task.name}. So maybe you should make one of those, and see where that gets you."
  end
  
  file "config/#{config}.yml" => "config/#{config}_example.yml" do |task|
    puts "Dude! I found #{task.prerequisites.first}, so I'll make a copy of it for you."
    cp task.prerequisites.first, task.name
    abort "Make sure it's cromulent to your setup, then rerun the last command."
  end
  
  task :environment => "config/#{config}.yml"
end
