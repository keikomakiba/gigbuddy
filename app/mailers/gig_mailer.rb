class GigMailer < ApplicationMailer
    def gig_mail(gig)
      @gig = gig

      mail to: @gig.user.email, subject: "投稿確認メール"
    end
end
