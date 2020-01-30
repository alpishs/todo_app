class Todo < ApplicationRecord
    has_one :users_todo
    belongs_to :project
    enum status: { "DONE": "DONE", "NEW": "NEW", "IN_PROGRESS": "IN_PROGRESS"}
end
