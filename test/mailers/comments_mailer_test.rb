require 'test_helper'

class CommentsMailerTest < ActionMailer::TestCase

  test 'submitted' do
    post = Post.create(title: "Yeah", content: "great content")
    comment = post.comments.create(content: "awesome")
    mail = CommentsMailer.submitted(comment)
    assert_equal "New comment!", mail.subject
    assert_equal ["blog-owner@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "awesome", mail.body.encoded
  end

end
