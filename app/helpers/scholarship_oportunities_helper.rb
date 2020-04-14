module ScholarshipOportunitiesHelper
  def map_student_discipline(student, scholarship_oportunity)
    student.scholarships.where(scholarship_oportunity_id: scholarship_oportunity.id).first.discipline
  end
end

