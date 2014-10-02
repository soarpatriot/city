require 'rails_helper'

describe MapHelper do

  context "log place " do
    it "one place" do
      user = create :user
      place = create :place
      location = [12.22,13.22]
      log_footprint(user,place.id,location)
      footprint = Footprint.first
      expect(footprint.user_id).to eq(user.id)
      expect(footprint.place_id).to eq(place.id)
      expect(footprint.count).to eq(1)
      expect(footprint.longitude).to eq(location[0])
      expect(footprint.latitude).to eq(location[1])

      log_footprint(user,place.id,location)
      footprint = Footprint.first

      expect(footprint.count).to eq(2)
      expect(Footprint.all.count).to eq(1)
    end

    it "two place" do
      user = create :user
      place = create :place
      location = [12.22,13.22]
      log_footprint(user,place.id,location)

      place1 = create :place
      log_footprint(user,place1.id,location)

      expect(Footprint.all.count).to eq(2)


      user1 = create :user
      log_footprint(user1,place.id,location)
      log_footprint(user1,place.id,location)
      expect(Footprint.all.count).to eq(3)

      user1_foot = Footprint.where(user:user1,place:place).first
      expect(user1_foot.count).to eq(2)

    end
  end
end
