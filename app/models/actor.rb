class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    char_name = self.characters.map { |entry| entry.name}
    show_name = self.shows.map { |entry| entry.name}
    char_name.product(show_name).map{ |name, show| "#{name} - #{show}"}
  end

end