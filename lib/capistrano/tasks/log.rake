namespace :log do
  task :rails do
    on roles :app do
      execute "tail -f #{shared_path}/log/production.log"
    end
  end
end
