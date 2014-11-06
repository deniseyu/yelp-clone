module ReviewsHelper

  def star_rating(rating)
    return rating if rating == 'N/A'
    remainder = (5 - rating)
    return "★" * rating.round + "☆" * remainder
  end

end
