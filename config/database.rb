# Dentro de Develpment hace un lOG de las consultas a STDOUT
if Sinatra::Application.development?
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

# De manera automática hace load de todos los archivos  
# Revisa http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

# Heroku controla a que base de datos nos conectamos configurando la variable de environment DATABASE_URL
# Para que pueda correr nuestro app en heroku debemos respetar esto. 
db = URI.parse(ENV['DATABASE_URL'] || "postgres://localhost/#{APP_NAME}_#{Sinatra::Application.environment}")

DB_NAME = db.path[1..-1]

# Nota:
#   Sinatra::Application.environment esta configurada al valor de ENV['RACK_ENV']
#   si ENV['RACK_ENV'] esta configurada.  Si ENV['RACK_ENV'] no esta configurada, se le pone el default
#   de :development

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :port     => db.port,
  :username => db.user,
  :password => db.password,
  :database => DB_NAME,
  :encoding => 'utf8'
)

