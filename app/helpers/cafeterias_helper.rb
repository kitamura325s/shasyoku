module CafeteriasHelper
  def choose_new_or_edit
    if action_name == 'new'
      cafeterias_path
    elsif action_name == 'edit'
      cafeteria_path
    end
  end
end