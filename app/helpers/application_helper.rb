module ApplicationHelper

  def humanized_role_name(current_user)
    return "Becario" if current_user.student?
    return "Administrador" if current_user.admin?
    return "Super Administrador" if current_user.super_admin?
    return "Exbecario" if current_user.former_student?
    return "Empresa" if current_user.company?
  end
end
