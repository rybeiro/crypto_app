module ApplicationHelper
  def data_br(data_us)
  	data_us.strftime("%d/%m/%Y %H:%M:%S")
  end

  def env_rails
    if Rails.env.development?
      t("enveroment_rails")
    end
  end
end
