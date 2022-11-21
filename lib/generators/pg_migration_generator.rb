require 'rails/generators/active_record/migration/migration_generator'
require "active_record/connection_adapters/postgresql_adapter"


class PgMigrationGenerator < ActiveRecord::Generators::MigrationGenerator
  source_root File.join(File.dirname(ActiveRecord::Generators::MigrationGenerator.instance_method(:create_migration_file).source_location.first), "templates")

  def create_migration_file
    set_local_assigns!
    validate_file_name!
    migration_template @migration_template, "db_pg/migrate/#{file_name}.rb"
  end
end