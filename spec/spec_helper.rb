require 'rubygems'

# Todas nuestras specs deben hacer un require 'spec_helper' (este archivo)


# Si RACK_ENV no esta definida, la define como 'test'. Sinatra por defaul usa development, 
# por lo que tenemos que sobre escribirla a menos que queramos hacerlo desde consola, cada vez. 
ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
