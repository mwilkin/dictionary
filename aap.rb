require('sinatra')
require('sinatra-reloader')
require('./lib/dictionary')
also_reload('lib/**/*.rb')

get('/') do
  @page_title = "home"
  erb(:index)
end
