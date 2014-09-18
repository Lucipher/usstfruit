require 'JPush'
master_secret = 'fcf02d4445d83de0cd6e9a7b';
app_key = '53ff54d6e04cc53a6c954b49';


client = JPush::JPushClient.new(app_key, master_secret);

logger = Logger.new(STDOUT);



@notifications = Notification.where("send_at is null")

@notifications.each do |notification|
  
  payload =JPush::PushPayload.new(platform: JPush::Platform.all,
      audience: JPush::Audience.all,
      notification: JPush::Notification.new(alert: notification.content )
  )
  result = client.sendPush(payload);
  if result.toJSON["msg_id"].present?
    notification.send_at = Time.now
    notification.save
  end
  
end


