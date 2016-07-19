class Task < ActiveRecord::Base
  scope(:not_done, -> do
    where({:done => false})
  end)
  belongs_to(:list)
  validates(:description, {:presence => true, :length => { :maximum => 50}})
  before_save(:downcase_description)

private

  def downcase_description
    self.description=(description().downcase)
  end
end
