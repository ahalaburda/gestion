class Pais < ActiveRecord::Base
	audited
	has_many :departamentos, dependent: :restrict_with_error
	has_many :bancos, dependent: :restrict_with_error
	has_many :personas, dependent: :restrict_with_error

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
