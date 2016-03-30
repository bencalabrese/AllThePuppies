# == Schema Information
#
# Table name: puppies
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Puppy < ActiveRecord::Base

  COLORS = %w(red blue golden chocolate black turquoise)
  SEXES = %w(M F)

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: SEXES

  def age
    @age = (Date.today - birth_date).to_i / 365
  end

  has_many :puppy_rental_requests, dependent: :destroy
end
