class BucketPolicy < ApplicationPolicy
  def create?
    user.is_admin_for?(record.round.group)
  end
end