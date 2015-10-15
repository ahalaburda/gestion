class RemoveColumnCategoriaFromPersonas < ActiveRecord::Migration
  def self.up
  	remove_column :personas, :categoria_id
  end
end
