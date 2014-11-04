 require 'rails_helper'

 describe VotesController do

   include TestFactories
   include Devise::TestHelpers
   before do
     request.env["HTTP_REFERER"] = '/'
     @user = authenticated_user
     @post = associated_post
     sign_in @user
   end

   describe '#up_vote' do
     it "adds an up-vote to the post" do
       expect {
         post( :up_vote, post_id: @post.id )
       }.to change{ @post.up_votes }.by 1
     end
   end


   describe '#down_vote' do
     it "adds an down-vote to the post" do
       expect {
         post( :down_vote, post_id: @post.id )
       }.to change{ @post.down_votes }.by 1
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
