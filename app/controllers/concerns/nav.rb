module Nav
extend ActiveSupport::Concern

def new_apply
  @nav_applies = Apply.where(orchestra_id: current_orchestra)
end

end