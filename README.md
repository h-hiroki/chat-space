
# DB設計


## users table

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|name|string|null: false, unique: true, add_index :users, :name|

### Association
- has_many :messages
- has_many :user_groups
- has_many :groups, through: :user_groups



## groups table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :messages
- has_many :user_groups
- has_many :users, through: :user_groups



## user_groups table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user



## messages table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|body|string|
|image|string|

### Association
- belongs_to :group
- belongs_to :user

