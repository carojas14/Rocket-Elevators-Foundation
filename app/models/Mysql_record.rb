class MysqlRecord < ApplicationRecord::Base
    # self.abstract_class = true
    establish_connection MYSQL_DATABASE
end