module SurveysHelper
  def display_stars(score, index)
    out = if score < index
      '<i class="fa-solid fa-paw fa-2x text-gray-300 mr-3"></i>'
    else
      '<i class="fa-solid fa-paw fa-2x text-indigo-600 mr-3"></i>'
    end
  out.html_safe
  end
end
