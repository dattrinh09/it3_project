class Teacher < ApplicationRecord
    belongs_to :subject ,:optional => true
end
