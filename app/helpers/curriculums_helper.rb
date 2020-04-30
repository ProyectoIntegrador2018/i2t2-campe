module CurriculumsHelper
  def humanize_language_proficiency(language)
    return "Básico" if language.elementary?
    return "Básico Limitado" if language.limited_working?
    return "Profesional Limitado" if language.minimum_professional?
    return "Profesional Avanzado" if language.full_professional?
    return "Bilingüe/Nativo" if language.native_bilingual?
  end
end
