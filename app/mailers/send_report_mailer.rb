class SendReportMailer < ApplicationMailer

  def picture_upload_report(send)
    @send = send
    mail to: @send.email, subject: "投稿完了の確認メール"
  end
  
end
