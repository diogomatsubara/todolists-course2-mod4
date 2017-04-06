class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: {
    in: %w(male female), message: "%{value} is not a valid gender."}

  validate :first_and_last_not_null
  validate :no_male_named_sue

  def self.get_all_profiles(min_year, max_year)
    self.where('birth_year BETWEEN ? AND ?', min_year, max_year).order(:birth_year)
  end

  def first_and_last_not_null
    if first_name == nil and last_name == nil
      errors.add(:first_name, "First and Last name can't be both nil")
      errors.add(:last_name, "First and Last name can't be both nil")
    end
  end

  def no_male_named_sue
    if gender == 'male' and first_name == 'Sue'
      errors.add(:first_name, "can't have men called Sue.")
    end
  end

end
