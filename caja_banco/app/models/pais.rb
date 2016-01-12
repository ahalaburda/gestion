class Pais < ActiveRecord::Base
	audited
	has_many :departamentos
	has_many :bancos
	has_many :personas

	validates :descripcion,
		:presence => {
			message: 'Este campo es requerido'},
		:length => {
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'}

	def nombre
    "#{descripcion}"
  end
end
