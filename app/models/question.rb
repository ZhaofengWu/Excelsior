class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  validates_presence_of :title
  field :body, type: String
  field :clicks, type: Integer, default: 0


  field :answers_count, type: Integer, default: 0
  field :total_votes, type: Integer, default: 0

  has_many :answers, dependent: :destroy
  belongs_to :author, class_name: "User"
  validates_presence_of :author


  def self.hottestq
    all.desc(:clicks, :answers_count, :total_votes, :created_at)
  end

  def self.search(search)
    # where("title like ?", "%#{search}%")
    where(title: "#{search}")

    # if search
    #   find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    # else
    #   find(:all)
    # end
  end
end
