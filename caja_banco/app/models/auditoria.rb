class Auditoria < ActiveRecord::Base
	before_create :set_current_user
	# after_update :set_current_user

	def set_current_user
		self.nombre_usuario = current_user.username
		self.save
	end
end
