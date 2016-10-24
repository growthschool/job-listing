class Resume < ApplicationRecord

  belongs_to :job
  belongs_to :user


  validates :attachment, presence: true



  end
