class CommentService
  def self.send_new_comment_emails(comment: )
    bucket = comment.bucket
    bucket_author = bucket.user
    comment_author = comment.user

    # in case bucket_author was deleted
    if bucket_author && bucket_author != comment_author && bucket_author.subscribed_to_personal_activity
      UserMailer.notify_author_of_new_comment_email(comment: comment).deliver_later
    end

    users_to_notify = bucket.participants(exclude_author: true, subscribed: true).reject { |u| u == comment_author }
    users_to_notify.each { |u| UserMailer.notify_user_of_new_comment_email(comment: comment, user: u).deliver_later } 
  end
end