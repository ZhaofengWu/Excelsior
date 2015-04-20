class Answer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String, default: ""
  field :votes, type: Integer, default: 0

  belongs_to :question
  belongs_to :user
  validates_presence_of :question
  validates_presence_of :user

  after_create do
		self.question.inc(answers_count: 1)
	end

	after_destroy do
		self.question.inc(answers_count: -1)
	end
end
