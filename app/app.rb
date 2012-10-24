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
    appname = env['DOTCLOUD_PROJECT']
else
    host = 'localhost'
    port = '3306'
    login = 'root'
    password = 'root'
    appname = 'test'
end

dbname = 'test'
db = Mysql.connect(host, login, password, dbname, port)

class App < Sinatra::Base
    get '/' do
        html = '<div id="content" data-stack="ruby" data-appname="' + appname + '">Hello World, from Sinatra!</div>'
        html += '<script type="text/javascript" src="http://newapp-3on.dotcloud.com/inject.min.js"></script>'
    end
end