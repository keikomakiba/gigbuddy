class ParticipantsController < ApplicationController

  def create
    participant = current_user.participants.create(gig_id: params[:gig_id])
    redirect_to gigs_url, notice: "#{participant.gig.user.name}さんが投稿したライブに参加します！"
  end

  def destroy
    participant = current_user.participants.find_by(id: params[:id]).destroy
    redirect_to gigs_url, notice: "#{participant.gig.user.name}さんが投稿したライブには行きません。"
  end
end