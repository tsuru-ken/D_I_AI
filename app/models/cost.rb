class Cost < ApplicationRecord
  has_many :partner_cost_labels, dependent: :destroy
  has_many :partners, through: :partner_cost_labels
end
#   # 検索条件として許可する属性
#   def self.ransackable_attributes(auth_object = nil)
#     super + ['id', 'breakdown', 'created_at', 'updated_at']
#   end

#   # 関連するモデルの検索条件を許可
#   def self.ransackable_associations(auth_object = nil)
#     ["partners"]
#   end

