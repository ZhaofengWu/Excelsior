class Favorite
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String, default: ""
  field :votes, type: Integer, default: 0

  belongs_to :user
  validates_presence_of :user
# 接着做这里
# 接着做这里
# 接着做这里
# 接着做这里
# 接着做这里
# 接着做这里
# 接着做这里
#   after_create do

# 		self.question.inc(answers_count: 1)
# 	end

# 	after_destroy do
# 		self.question.inc(answers_count: -1)
# 	end
end
