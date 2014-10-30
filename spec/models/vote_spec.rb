require 'rails_helper'

describe Vote do
  describe "validations" do

    before do
      @v_good1 = Vote.new(value: 1)
      @v_good2 = Vote.new(value: -1)
      @v_bad = Vote.new(value: 2)
    end
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @v_good1.valid? ).to eq(true)
        expect( @v_good2.valid? ).to eq(true)
        expect( @v_bad.valid? ).to eq(false)
      end
    end

  end
end
