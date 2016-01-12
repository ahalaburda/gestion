class Persona < ActiveRecord::Base
  audited
  belongs_to :tipo_de_persona
  belongs_to :pais
  belongs_to :departamento
  belongs_to :ciudad
  has_many :users
  has_many :cajas
  has_many :boletas_de_depositos
  has_many :firmantes
  has_many :cheques_entrantes
  has_one :apertura_caja

  validates :nombre,
	:presence => {
		message: 'Este campo es requerido'},
	:length => {
		:maximum => 20,
		:too_long => 'debe tener como maximo %{count} caracteres'},
	:format => {
		with: /\A[a-zA-Z]+\z/,
		message: 'Solo permite letras'}

	validates :apellido,
	:presence => {
		message: 'Este campo es requerido'},
	:length => {
		:maximum => 20,
		:too_long => 'debe tener como maximo %{count} caracteres'},
	:format => {
		with: /\A[a-zA-Z]+\z/,
		message: 'Solo permite letras'}

	validates :cedula_identidad,
	:presence => {
		message: 'Este campo es requerido'},
  :numericality => true,
  :length => {maximum: 30}

	validates :direccion,
		:presence => {
			message: 'Este campo es requerido'},
		:length => {
			:maximum => 50,
			:too_long => 'Debe tener como maximo %{count} caracteres'}

	validates :pais_id,
		:presence => {
			message: 'Debe seleccionar un Pais'}

	validates :departamento_id,
		:presence => {
			message: 'Debe seleccionar un Departamento'}

	validates :ciudad_id,
		:presence => {
			message: 'Debe seleccionar una Ciudad'}

	validates :telefono,
		:presence => {
			message: 'Este campo es requerido'},
		:length => {
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'},
		:numericality => true

	validates :correo,
		:length =>{
				:maximum => 50,
				:too_long => 'Debe tener como maximo %{count} caracteres'}

	validates :tipo_de_persona_id,
		:presence => {
			message: 'Debe seleccionar un Tipo de persona'}

	def nombre_apellido
    "#{nombre} #{apellido}"
  end
end
