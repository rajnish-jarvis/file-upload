class Attachement < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_one_attached :file
  self.per_page = 5

  def update_file_url(url)
    self.update(url: url, tiny_url: get_sort_url(url))
  end

  def get_sort_url(url)
    api= "https://tinyurl.com/api-create.php?url=#{url}"
    response = HTTParty.get(api)
  end

end
