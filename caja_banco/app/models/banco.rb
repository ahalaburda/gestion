class Banco < ActiveRecord::Base
	validates_presence_of :nombre, :allow_blank => true, :message => "No puede estar en blanco"
	validates_presence_of :direccion, :allow_blank => true, :message => "No puede estar en blanco"
	validates_presence_of :telefono, :allow_blank => true, :message => "No puede estar en blanco"
end
