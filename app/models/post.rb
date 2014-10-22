class Post < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }
    validates :title, presence: true, length: {maximum: 140}
    validates :body, presence: true, length: {maximum: 800}
    has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('qmark.jpeg')
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  	def self.search(query)
  	  
	  if query
	  	query = "%" + query.downcase + "%"
        find(:all, :conditions => ['LOWER(title) LIKE ? OR LOWER(body) LIKE ?', query, query] )
        #where("LOWER(title) = ? OR LOWER(body) = ?", query, query)
	  else
	    find(:all)
	  end
	end
end