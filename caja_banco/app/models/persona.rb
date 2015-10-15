class Persona < ActiveRecord::Base
  belongs_to :tipo_de_persona
  belongs_to :categoria
  belongs_to :pais
  belongs_to :departamento
  belongs_to :ciudad

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
		message: 'Este campo es requerido'}

	validates :direccion,
		:presence => {
			message: 'Este campo es requerido'},
		:length => { 
			:maximum => 50,
			:too_long => 'Debe tener como maximo %{count} caracteres'},
		:uniqueness => {
			message: 'Este tipo de movimiento ya existe'}

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
		:format => {
			with: /\A[0-9]+\z/,
			message: 'solo permite numeros'}

	validates :correo,
		:length =>{
				:maximum => 50,
				:too_long => 'Debe tener como maximo %{count} caracteres'}

	validates :tipo_de_persona_id,
		:presence => {
			message: 'Debe seleccionar un Tipo de persona'}
end