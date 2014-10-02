require 'rails_helper'

describe PushHelper do

  context "push  " do
    it "success" do
      hash = {sdfasdf:"好的"}
      token = "95152f58b942e8e3762ec83c1d86f7cf80f8c70a17cd34674a0300eb0994abb8"

      # push_to_ios token,"aaa",hash
      # Rpush.push
      # Rpush.apns_feedback
    end

    it "cu" do

      token = "95152f58b942e8e3762ec83c1d86f7cf80f8c70a17cd34674a0300eb0994abb8"


      app = Rpush::Apns::App.new
      app.name = "ios_app"
      app.certificate = File.read(Rails.root.join("config/apns_sandbox.pem"))
      app.environment = "sandbox" # APNs environment.
      app.password = "1234"
      app.connections = 1
      app.save!


      n = Rpush::Apns::Notification.new
      n.app = Rpush::Apns::App.find_by_name("ios_app")
      n.device_token = token
      n.alert = "hi mom!adsfadfadfadfadfadfadfasdfadf"
      n.data = { message: "hi mom!"}
      n.save!
      # binding.pry
      # Rpush.push
      # Rpush.apns_feedback
    end


    it "push_to_android -test " do



=begin
      master_secret = 'b3662512b1bf418e32881d6a'
      app_key = '645a086d5340634f0b723e62'
      client = JPush::JPushClient.new(app_key, master_secret)
      logger = Logger.new(STDOUT)
      payload = JPush::PushPayload.build(
          platform: JPush::Platform.all,
          notification: JPush::Notification.build(
              alert: '大师兄'),
          audience: JPush::Audience.build(
              _alias: ["170阿坝"]))

      client.sendPush(payload)
=end
      # logger.debug(" sdf " +  res.toJSON)


  
    end

    it "custom message" do

=begin

      master_secret = 'b3662512b1bf418e32881d6a'
      app_key = '645a086d5340634f0b723e62'
      client = JPush::JPushClient.new(app_key, master_secret)
      logger = Logger.new(STDOUT)

      payload1 = JPush::PushPayload.build(
          platform: JPush::Platform.all,
          audience: JPush::Audience.build(
              _alias: ["170阿坝"]),

          message: JPush::Message.build(
              msg_content: "message content test",
              title: "message title test",
              content_type: "message content type test",
              extras: {"key1" => "value1", "key2" => "value2"})
      )
      result = client.sendPush(payload1)
      logger.debug("Got result  " +  result.toJSON)
=end

    end


    it "push comment to androdid" do


      from_user = create :user

      to_user = create :user
      scrip = create :scrip, owner: to_user

      comment = create :comment, scrip:scrip, user:from_user
      type = "comment"

      message = generate_push_message from_user, scrip, type, comment
      expect(message.extras[:from_id]).to eq(from_user.id)

    end

    it "favorite scrip to androdid" do


      from_user = create :user
      to_user = create :user
      scrip = create :scrip, owner: to_user

      comment = create :comment, scrip:scrip, user:from_user
      type = "comment"

      message = generate_push_message from_user, scrip, type, comment
      expect(message.extras[:from_id]).to eq(from_user.id)

      2.times do
        # begin
          push_to_android(from_user,scrip,type,comment)
        # rescue Exception => e
          # Rails.logger.info("error .....,  #{e.to_s}")
        # end

        # binding.pry
      end

    end

    it "push_to_android" do



=begin
      author = create :user
      device_token = "95152f58b942e8e3762ec83c1d86f7cf80f8c70a17cd34674a0300eb0994abb8"
      device = create :android, user_id: author.id, token: device_token

      jpush_bulider("告诉你。。","162Soar")
=end

    end





  end
end
