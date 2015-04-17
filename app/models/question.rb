class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  validates_presence_of :title
  field :body, type: String

  field :answers_count, type: Integer, default: 0

  has_many :answers, dependent: :destroy
end
