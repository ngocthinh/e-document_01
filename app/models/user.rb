class User < ApplicationRecord
  has_many :documents, class_name: Document.name, foreign_key: :user_id
  has_many :downloads, class_name: Download.name, foreign_key: :user_id
  has_many :favorites, class_name: Favorite.name, foreign_key: :user_id
  has_many :reads, class_name: Read.name, foreign_key: :user_id
  has_many :comments, class_name: Comment.name, foreign_key: :user_id
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :user_one, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :user_two, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
end
