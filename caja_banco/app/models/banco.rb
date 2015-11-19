class Banco < ActiveRecord::Base
  belongs_to :pais
  belongs_to :departamento
  belongs_to :ciudad
  has_many :movimientos_de_bancos
  has_many :cheques_entrantes
  has_many :boletas_de_depositos
  has_many :cuentas_bancarias

	validates :nombre,
		:presence => {
			message: 'Este campo es requerido'},
		:length => {
			:maximum => 20,
			:too_long => 'debe tener como maximo %{count} caracteres'},
		:format => {
			with: /\A[a-zA-Z]+\z/,
			message: 'Solo permite letras'},
		:uniqueness => {
			message: 'El nombre que desea usar ya ha sido utilizado'}

	validates :sucursal,
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
		:presence =>{
				message: 'Este campo es requerido'},
		:length =>{
				:maximum => 50,
				:too_long => 'Debe tener como maximo %{count} caracteres'}

	def banco_sucursal
    "#{nombre} - #{sucursal}"
  end
end
