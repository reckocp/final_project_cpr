class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def as_json(_)
    super(include: :user)
  end
end
