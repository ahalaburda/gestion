class Parametro < ActiveRecord::Base
  mount_uploader :logo_empresa, LogoEmpresaUploader
end
