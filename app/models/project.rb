class Project < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :todos,  dependent: :destroy
    validates_presence_of :name

    def project_users
        self.users.collect(&:email).join(",")
    end
end
