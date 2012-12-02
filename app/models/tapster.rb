class Tapster < ActiveRecord::Base
  attr_accessible :identifier, :question, :user_id
  belongs_to :user
  has_many :options, :order => :position
  validates_presence_of :question
  before_validation :generate_identifier, :on => :create
  before_validation :generate_options, :on => :create
  def to_param
    self.identifier
  end
  private
  def generate_identifier
    self.identifier = Digest::SHA1.hexdigest("#{self.user.id}--#{self.user.tapsters.count}--#{Time.now}")
  end
  def generate_options
    if self.options.empty?
      self.options.build(:text => 'Yes')
      self.options.build(:text => 'No')
    end
  end
end
