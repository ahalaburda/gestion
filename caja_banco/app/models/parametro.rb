class Parametro < ActiveRecord::Base
  audited
  mount_uploader :logo_empresa, LogoEmpresaUploader
  belongs_to :estado
end
