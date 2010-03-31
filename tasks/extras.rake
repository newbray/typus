namespace :typus do

  desc "Install ckeditor."
  task :ckeditor do
    system "script/plugin install git://github.com/galetahub/rails-ckeditor.git --force"
    load File.join Rails.root, 'vendor', 'plugins', 'rails-ckeditor', 'tasks', 'ckeditor_tasks.rake'
    Rake::Task["ckeditor:install"].invoke
    Rake::Task["ckeditor:config"].invoke
  end

  desc "Install acts_as_list, acts_as_tree and paperclip."
  task :misc do

    plugins = [ "git://github.com/thoughtbot/paperclip.git", 
                "git://github.com/rails/acts_as_list.git", 
                "git://github.com/rails/acts_as_tree.git" ]

    # plugins << "git://github.com/NZKoz/rails_xss.git" if Rails.version.eql?("2.3.5")

    system "script/plugin install #{plugins.join(" ")} --force"

  end

  desc "Install ssl_requirement."
  task :ssl do
    system "script/plugin install git://github.com/fesplugas/ssl_requirement.git --force"
  end

end
