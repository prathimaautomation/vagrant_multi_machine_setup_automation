# ruby syntax

def set_env vars
  command = <<~HEREDOC
  echo "Setting Environment Variables"
  source ~/.bashrc
  HEREDOC

vars.each do |key, value|
  command += <<~HEREDOC
  if [ -z "$#{key}" ]; then
  echo "export #{key}=#{value}" >> ~/.bashrc
  fi
  HEREDOC
end

return command
end

Vagrant.configure("2") do |config|
  
  # creating vm called app
  config.vm.define "app" do |app|
    # using ubuntu 16.04
    app.vm.box = "ubuntu/xenial64"  
    # creating private ip
    app.vm.network "private_network", ip: "192.168.10.100"
    # creating aliases to replace ip
    app.hostsupdater.aliases = ["development.local"]
    # syncing the local app onto vm
    app.vm.synced_folder "app", "/home/vagrant/app"
    app.vm.synced_folder ".", "/home/vagrant/environment"
    #app.vm.provision "shell", path: "environment/app/provision.sh"
    #app.vm.synced_folder ".", "/home/ubuntu/environment"
    app.vm.provision "shell", path: "environment/provision.sh", privileged: false
    app.vm.provision "shell", inline: set_env({ DB_HOST: "mongodb://192.168.10.150:27017/posts" }), privileged: false
  end
  config.vm.define "db" do |db|
    config.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.150"
    db.hostsupdater.aliases = ["database.local"]
    db.vm.synced_folder "db", "/home/vagrant/db"
    db.vm.provision "shell", path: "db/provision.sh", privileged: false
  end
end