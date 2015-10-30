class Ciudad < ActiveRecord::Base

	belongs_to :departamento
	has_many :bancos

  validates :descripcion,

			:presence => {
				message: 'Este campo es requerido'},
			:length => { 
				:maximum => 20,
				:too_long => 'debe tener como maximo %{count} caracteres'},
			:format => {
				with: /\A[a-zA-Z]+\z/,
				message: 'Solo permite letras'},
			:uniqueness => {
				message: 'El nombre que desea usar ya a sido utilizado'}

			validates :codigo_postal,
				:length => { 
					:maximum => 8,
					:too_long => 'debe tener como maximo %{count} caracteres'},
				:format => {
					with: /\A[0-9]+\z/,
					message: 'solo permite numeros'}

			validates :departamento_id,
				:presence => {
					message: 'Debe seleccionar un Departamento'}	
	def nombre
    "#{descripcion}"
  end
end