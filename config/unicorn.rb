# app_path = File.expand_path('../', __FILE__)

# worker_processes 2

# working_directory app_path

# pid "#{app_path}/tmp/pids/unicorn.pid"

# # listen 3000
# listen  File.expand_path('tmp/sockets/unicorn.sock', app_path)

# stderr_path "#{app_path}/log/unicorn.stderr.log"
# stdout_path "#{app_path}/log/unicorn.stdout.log"

# timeout 60

# preload_app true
# GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

# check_client_connection false

# run_once = true

# before_fork do |server, worker|
#   defined?(ActiveRecord::Base) &&
#     ActiveRecord::Base.connection.disconnect!

#   if run_once
#     run_once = false # prevent from firing again
#   end

#   old_pid = "#{server.config[:pid]}.oldbin"
#   if File.exist?(old_pid) && server.pid != old_pid
#     begin
#       sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
#       Process.kill(sig, File.read(old_pid).to_i)
#     rescue Errno::ENOENT, Errno::ESRCH => e
#       logger.error e
#     end
#   end
# end

# after_fork do |_server, _worker|
#   defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
# end


app_path = File.expand_path('../../', __FILE__)

# ENV['BUNDLE_GEMFILE'] = rails_root + "/Gemfile"

worker_processes 1

#working_directory "#{app_path}/current"
working_directory app_path
#working_directory app_path + "/current"

# pid File.expand_path('../../../tmp/pids/unicorn.pid', __FILE__)
pid "#{app_path}/tmp/pids/unicorn.pid"
#pid "#{app_path}/shared/tmp/pids/unicorn.pid"

# listen 8080
listen "#{app_path}/tmp/sockets/unicorn.sock"
#listen "#{app_path}/shared/tmp/sockets/unicorn.sock"

# stderr_path File.expand_path('../../../log/unicorn_stderr.log', __FILE__)
# stdout_path File.expand_path('../../../log/unicorn_stdout.log', __FILE__)
# stderr_path "#{app_path}/shared/log/unicorn.stderr.log"
# stdout_path "#{app_path}/shared/log/unicorn.stdout.log"
stderr_path "#{app_path}/log/unicorn.stderr.log"
stdout_path "#{app_path}/log/unicorn.stdout.log"

timeout 60

preload_app true
GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

check_client_connection false

run_once = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  if run_once
    run_once = false # prevent from firing again
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH => e
      logger.error e
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end






# worker_processes 2

# app_path = '/var/www/job-match'

# working_directory = app_path

# listen  File.expand_path('tmp/sockets/unicorn.sock', app_path)
# pid File.expand_path('tmp/pids/unicorn.pid', app_path)

# stderr_path File.expand_path('log/unicorn.stderr.log', app_path)
# stdout_path File.expand_path('log/unicorn.stdout.log', app_path)

# timeout 500

# preload_app true
# GC.respond_to?(:copy_on_write_friendly=) and
#   GC.copy_on_write_friendly = true
# before_fork do |server, worker|
#   defined?(ActiveRecord::Base) and
#     ActiveRecord::Base.connection.disconnect!
#   old_pid = "#{server.config[:pid]}.oldbin"
#   if old_pid != server.pid
#     begin
#       sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
#       Process.kill(sig, File.read(old_pid).to_i)
#     rescue Errno::ENOENT, Errno::ESRCH
#     end
#   end
#   sleep 1
# end
# after_fork do |server, worker|
#   defined?(ActiveRecord::Base) and
#     ActiveRecord::Base.establish_connection
# end


