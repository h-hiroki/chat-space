json.id           @message.id
json.body         @message.body
json.image        @message.image.thumb.url
json.name         @message.user.name
json.created_at   @message.created_at.strftime('%Y-%m-%d %H:%M:%S')
