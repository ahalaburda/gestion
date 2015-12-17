class Departamento < ActiveRecord::Base
  belongs_to :pais
  has_many :cuidades
  has_many :bancos
  has_many :personas

  validates :descripcion,
		:presence => {
			message: 'Este campo es requerido'},
		:length => {
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'}
	validates :pais_id,
		:presence => {
			message: 'Debe seleccionar un pais'}
	def nombre
    "#{descripcion}"
  end
end
