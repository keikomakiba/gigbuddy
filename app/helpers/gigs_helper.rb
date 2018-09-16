module GigsHelper
    def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_gigs_path
    elsif action_name == 'edit'
      gig_path
    end
    end

end
