module SurveysHelper
  def display_stars(score, index)
    out = if score < index
      '<i class="fa-regular fa-star fa-2x"></i>'
    else
      '<i class="fa-solid fa-star fa-2x"></i>'
    end
  out.html_safe
  end
end
