class Wine < ActiveRecord::Base

has_many :log_entries, dependent: :destroy

scope :aged, -> { where('year < 1999') }
scope :by, ->(name) { where('name = ?', name) }

VARIETALS = ["merlot", "chianti", "malbec", 
	"cabernet sauvignon", "pinot noir", "zinfandel",
	"chardonnay", "sauvignon blanc", "pinot grigio"]

validates :name, :year, :country, presence: true
validates :year, numericality: { only_integer: true },
   unless: "year.blank?"
validates :varietal, :inclusion => { :in => VARIETALS }   	

end
