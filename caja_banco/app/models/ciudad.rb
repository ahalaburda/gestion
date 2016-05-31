class Ciudad < ActiveRecord::Base
	audited
	belongs_to :departamento
	has_many :bancos, dependent: :restrict_with_error
	has_many :personas, dependent: :restrict_with_error

  validates :descripcion,

			:presence => {
				message: 'Este campo es requerido'},
			:length => {
				:maximum => 20,
				:too_long => 'debe tener como maximo %{count} caracteres'}

			validates :codigo_postal,
				:length => {
					:maximum => 8,
					:too_long => 'debe tener como maximo %{count} caracteres'},
				:format => {
					with: /\A[0-9]+\z/,
					message: 'solo permite numeros'},
				allow_blank: true

			validates :departamento_id,
				:presence => {
					message: 'Debe seleccionar un Departamento'}
	def nombre
    "#{descripcion}"
  end
end
