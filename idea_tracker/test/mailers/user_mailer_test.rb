require 'test_helper'
require 'open-uri'

class UserMailerTest < ActionMailer::TestCase
  tests UserMailer
  setup do
    @user = User.create(id: 1, email: "testmail@ubc.ca", password: "12341234", first_name: "Test", last_name: "Mail", admin: "1")
    @idea = ideas(:one)
    @participant = subscriptions(:one)
    @email = "tanat.ratana@gmail.com,me@henrychsiao.com"
    @thread = Commontator::Thread.create(id: 1, commontable_type: "Idea", commontable_id: 1)
  end

  test "welcome_email" do
    # Send the email, then test that it got queued
    email = UserMailer.welcome_email(@user).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the receiver/ sender is what we expect it to
    assert_equal ['cpsc3192014@gmail.com'], email.from
    assert_equal ['testmail@ubc.ca'], email.to
    assert_equal 'welcome to the Ideal Tracker', email.subject
  end
    test "edit_notification_email" do
    # Send the email, then test that it got queued
    email = UserMailer.edit_notification_email(@idea, @user).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the receiver/ sender is what we expect it to
    assert_equal ['cpsc3192014@gmail.com'], email.from
    assert_equal ['testmail@ubc.ca'], email.to
    assert_equal 'Someone edit idea on Ideal Tracker', email.subject
  end

    test "idea_email" do
    # Send the email, then test that it got queued
    email = UserMailer.idea_email(@idea, @email).deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the receiver/ sender is what we expect it to
    assert_equal ['cpsc3192014@gmail.com'], email.from
    assert_equal ['tanat.ratana@gmail.com','me@henrychsiao.com'], email.to
    assert_equal 'Idea for YOU!!!', email.subject
  end

    test "comment_email" do
    # Send the email, then test that it got queued
    email = UserMailer.comment_email(@thread, @user, "this is for testing!").deliver
    assert !ActionMailer::Base.deliveries.empty?

    # Test the receiver/ sender is what we expect it to
    assert_equal ['cpsc3192014@gmail.com'], email.from
    assert_equal ['testmail@ubc.ca'], email.to
    assert_equal 'Someone post a comment on Ideal Tracker', email.subject
  end


end