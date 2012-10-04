#!/usr/bin/env ruby

require 'rubygems' if RUBY_VERSION < '1.9'
require 'mysql'
require 'json'

env = JSON.parse(File.read('/home/dotcloud/environment.json'))
host = env['DOTCLOUD_DB_MYSQL_HOST']
port = env['DOTCLOUD_DB_MYSQL_PORT']
login = env['DOTCLOUD_DB_MYSQL_LOGIN']
password = env['DOTCLOUD_DB_MYSQL_PASSWORD']
dbname = 'test'
tries = 0

print "Creating the database #{dbname}"
begin
    print "."
    db = Mysql.connect(host, login, password, nil, port)
    db.query("CREATE DATABASE IF NOT EXISTS #{dbname}")
rescue => e
    sleep(1)
    tries += 1;
    retry if tries < 25
ensure
    db.close if db
    print "\n"
end
