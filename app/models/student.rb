# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(word)
    if word == ""
      @students = self.all.each{|s| s.name}
    else 
      @students = self.where("name LIKE ?", "%#{word}%")
    end
  end
  
  
end
