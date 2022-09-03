module ApplicationHelper
  def data_br(data_us)
    data_us.strftime('%B %e, %Y')
  end
end
