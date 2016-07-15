require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  @page_title = "Dictionary"
  @words = Word.all()
  erb(:index)
end

get('/words') do
  @page_title = "Dictionary"
  @words = Word.all()
  erb(:words)
end

get('/words/new') do
  erb(:word_add)
end

post('/words') do
  word = Word.new({:word => params.fetch('word')})
  word.save()
  @words = Word.all()
  erb(:word_success)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definition_add)
end

post('/definitions') do
  definition = params.fetch('definition')
  @definition = Definition.new({:definition => definition})
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:definition_success)
end
