class PuppyRentalRequest < ActiveRecord::Base

  STATUSES = %w(PENDING APPROVED DENIED)

  validates :puppy_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: STATUSES

  validate :does_not_overlap_with_approved_request

  def does_not_overlap_with_approved_request
    unless overlapping_approved_requests.empty?
      errors[:base] << "Can't overlap with an approved request"
    end
  end
  # def date_range
  #   (start_date..end_date)
  # end

  def overlapping_requests
    self.class.all.select do |request|
      next if request.id == id
      ((start_date - request.end_date) * (request.start_date - end_date) >= 0) && request.puppy_id == puppy_id
    end
    # SQL is hard, dude.
    # PuppyRentalRequest.find_by_sql(
    #   "SELECT
    #     *
    #   FROM
    #     puppy_rental_requests AS other
    #   WHERE
    #     ((DATEDIFF(DAY, #{start_date}, other.end_date) * DATEDIFF(DAY, other.start_date, #{end_date})) >= 0)
    #       AND other.puppy_id = #{puppy_id}") #, start_date, end_date, puppy_id)
  end

  def overlapping_approved_requests
    overlapping_requests.select do |request|
      request.status == "APPROVED"
    end
  end

  belongs_to :puppy
end
