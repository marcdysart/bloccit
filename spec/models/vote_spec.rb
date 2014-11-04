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

     describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save
     end
   end
end

def associated_post(options={})
   post_options = {
     title: 'Post title',
     body: 'Post bodies must be pretty long.',
     topic: Topic.create(name: 'Topic name'),
     user: authenticated_user
   }.merge(options)
  Post.create(post_options)
end

def authenticated_user(options={})
   user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
   user = User.new(user_options)
   user.skip_confirmation!
   user.save
   user
end
