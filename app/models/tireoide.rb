class Tireoide < ApplicationRecord

  def self.identificacao(nome, data_nascimento, data_exame)
  # posso apagar pois está sem função
  end
  
  def self.ecotextura_gland(value)
    if value == 'homogenea'
      eco_gl = "homogênea"
    elsif value == 'heterogenea'
      eco_gl = "heterogênea"
    end
    return eco_gl
  end

  def self.contorno_gland(value)
    if value == 'regulares'
      cont_gl = "regulares"
    elsif value == 'irregulares'
      cont_gl = "irregulares"
    elsif value == 'lobulados'
      cont_gl = "lobulados"
    end
    return cont_gl
  end
  
  def self.ltd_volume(a, b, c)
    ltd_vol = a.to_f * b.to_f * c.to_f * 0.52
  end
  def self.lte_volume(a, b, c)
    lte_vol = a.to_f * b.to_f * c.to_f * 0.52
  end
  def self.istmo_volume(a, b, c)
    istmo_vol = a.to_f * b.to_f * c.to_f * 0.52
  end
  def self.volume_total(a, b, c)
    vol_total = a.to_f + b.to_f + c.to_f
  end

  def self.medida_volume(vol_total)
    if vol_total > 15
      med_vol = 'aumentadas'
    elsif vol_total < 5
      med_vol = 'reduzidas'
    else
      med_vol = 'normais'
    end
  end

  def self.pres_nodular(a)
    if a == "tir_nodular"
      pres_nod = "Com a presença dos nódulos descritos abaixo: "
    elsif a == "tir_anodular"
      pres_nod = "Ausência de formações nodulares."
    end
  end
  
end
