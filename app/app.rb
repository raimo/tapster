require 'rubygems' if RUBY_VERSION < '1.9'
require 'sinatra/base'
require 'mysql'
require 'json'

if FileTest.exist?('/home/dotcloud/environment.json')
    env = JSON.parse(File.read('/home/dotcloud/environment.json'))
    host = env['DOTCLOUD_DB_MYSQL_HOST']
    port = env['DOTCLOUD_DB_MYSQL_PORT']
    login = env['DOTCLOUD_DB_MYSQL_LOGIN']
    password = env['DOTCLOUD_DB_MYSQL_PASSWORD']
else
    host = 'localhost'
    port = '3306'
    login = 'root'
    password = 'root'
end

dbname = 'test'
db = Mysql.connect(host, login, password, dbname, port)

class App < Sinatra::Base
    get '/' do
        "Hello World!"
    end
end