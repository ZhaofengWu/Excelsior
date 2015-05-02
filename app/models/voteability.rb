class Voteability
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :anwser
  belongs_to :author, class_name: "User"
  validates_presence_of :answer
  validates_presence_of :author

  field :voted, type: Boolean, default: false

  after_create do
  end  
  after_destroy do
  end

end