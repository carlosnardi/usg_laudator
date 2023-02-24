puts "Bem vindo ao USG Laudator"
puts "Insira os dados solicitados para um laudo preciso de ultrassonografia de tireoide"
puts

# Identificação 
print "Nome: "
nome = gets.chomp
print "Data de nascimento: "
dta_nas = gets.chomp
print "Data do exame (dd/mm/aa): "
dt_im = gets.chomp

# Biometria
puts "Aspecto glandular: Homogênea (0), Heterogênea (1)"
asp_gl = gets.to_i
if asp_gl == 0
  gland = "homogênea"
else
  gland = "heterogênea"
end
puts "Biometria: LTD (L/AP/T) - Digite as medidas na sequência em centímetros"
ltd_l = gets.to_f
ltd_ap = gets.to_f
ltd_t = gets.to_f
ltd_vol = ltd_l * ltd_ap * ltd_t * 0.51

puts "Biometria: LTE (L/AP/T)"
lte_l = gets.to_f
lte_ap = gets.to_f
lte_t = gets.to_f
lte_vol = lte_l * lte_ap * lte_t * 0.51

puts "Biometria: Istmo (AP)"
istmo_ap = gets.to_f
if istmo_ap >= 0.50
  istmo_l = gets.to_f
  istmo_t = gets.to_f
  istmo_vol = istmo_l * istmo_ap * istmo_t * 0.51
  
  istmo = "#{istmo_l} x #{istmo_ap} x #{istmo_t} cm, volume de #{istmo_vol.ceil(2)} ml"
else
  istmo = "#{istmo_ap} cm"
  istmo_vol = 0
end
gl_volume = ltd_vol + lte_vol + istmo_vol

if gl_volume >= 5 and gl_volume <= 15
  volume = "normal"
elsif gl_volume > 15
  volume = "aumentada"
elsif gl_volume < 5
  volume = "reduzida"
end

# Nódulos
puts "Há a presença de nódulos? (y/n)"
ha_nod = gets.chomp
if ha_nod == "n"
  pres_nod = "não se evidenciando lesões focais sólidas ou císticas"
elsif ha_nod == "y"
  print "Quantidade de nódulos? "
  qdd_nod = gets.to_i
  if qdd_nod == 1
    pres_nod = "apresentando formação nodular descrita a seguir"
  else
    pres_nod = "apresentando formações nodulares descritas a seguir"
  end
  i = 0
  nod_num = 0
  nodulos = []
  while i < qdd_nod
    puts "Topografia: LTD - terço superior(0), LTD - terço médio(1), LTD - terço inferior(2), LTE - terço superior(3), LTE - terço médio(4) LTE - terço inferior(5), istmo(6)"
    topo = ['terço superior do lobo tireoidiano direito', 'terço médio do lobo tireoidiano direito', 'terço inferior do lobo tireoidiano direito', 'terço superior do lobo tireoidiano esquerdo', 'terço médio do lobo tireoidiano esquerdo', 'terço inferior do lobo tireoidiano esquerdo', 'istmo']
    topo_ask = gets.to_i
    topo_choice = topo[topo_ask]
    
    puts "Medida em cm: (L/AP/T)"
    medida_l = gets.to_f
    medida_ap = gets.to_f
    medida_t = gets.to_f
    nod_vol = medida_l * medida_ap * medida_t * 0.51
    
    puts "Composição: cístico(0), espongiforme(1), misto C>S(2), misto S>C(3), sólido(4)"
    comp_nod = ["cístico", "espongiforme", "sólido-cístico com componente cístico predominante", "sólido-cístico", "sólido"]
    comp_nod_ask = gets.to_i
    comp_nod_choice = comp_nod[comp_nod_ask]
    
    puts "Ecogenicidade: anecóico(0), isoecogênico(1), hiperecogênico(2), hipoecogênico(3), muito hipoecogênico(4)"
    eco_nod = ["anecóico", "isoecogênico", "hiperecogênico",  "hipoecogênico", "muito hipoecogênico"]
    eco_nod_ask = gets.to_i
    eco_nod_choice = eco_nod[eco_nod_ask]
    
    puts "Qual a forma: mais largo do que alto(0), mais alto do que largo(1)"
    forma_nod = ["eixo horizontal maior que o vertical", "eixo vertical maior que o horizontal"]
    forma_nod_ask = gets.to_i
    forma_nod_choice = forma_nod[forma_nod_ask]
    
    puts "Margens: bem delimitada(0), contornos pouco nítidos(1), lobulados(2), irregulares(3), extensão extra-tireoidiana(4)"
    margem_nod = ["contornos bem delimitados", "contornos pouco nítidos", "contornos lobulados", "contornos irregulares", "extensão extra-tireoidiana"]
    margem_nod_ask = gets.to_i
    margem_nod_choice = margem_nod[margem_nod_ask]
    
    puts "Focos ecogênicos: ausente(0), artefato em cauda de cometa(1), macrocalcificação(2), calcificação periférica(3), microcalcificação(4)"
    focos_nod = ["sem focos ecogênicos", "com artefato em cauda de cometa", "com macrocalcificação", "com calcificação periférica", "com microcalcificação"]
    focos_nod_ask = gets.to_i
    focos_nod_choice = focos_nod[focos_nod_ask]

    tr_comp = [0, 0, 0, 1, 2]
    tr_comp_choice = tr_comp[comp_nod_ask]
    tr_eco = [0, 1, 1, 2 , 3]
    tr_eco_choice = tr_eco[eco_nod_ask]
    tr_forma = [0, 3]
    tr_forma_choice = tr_forma[forma_nod_ask]
    tr_margem = [0, 0, 2, 2, 3]
    tr_margem_choice = tr_margem[margem_nod_ask]
    tr_focos = [0, 0, 1, 2, 3]
    tr_focos_choice = tr_focos[focos_nod_ask]
    tr_total = tr_comp_choice + tr_eco_choice + tr_forma_choice + tr_margem_choice + tr_focos_choice
    puts tr_total 
    if tr_total == 0 || tr_total == 1
      tr = 1
    elsif tr_total == 2
      tr = 2
    elsif tr_total == 3
      tr = 3
    elsif tr_total >= 4 && tr_total <= 6
      tr = 4
    elsif tr_total >= 7
      tr = 5
    end
    
    puts "Chammas: ausência de fluxo(0), fluxo periférico(1), fluxo predominantemente periférico(2), fluxo central maior que o periférico(3), fluxo exclusivamente central(4)"
    chammas = ["Ausência de fluxo ao Doppler (Chammas I)", "Vascularização exclusivamente periférica (Chammas II), ", "Vascularização predominantemente periférica (Chammas III), ", "Vascularização central predominante (Chammas IV), ", "Vascularização exclusivamente central (Chammas V), "]
    chammas_ask = gets.to_i
    chammas_choice = chammas[chammas_ask]
    if chammas_ask == 0
      ir = "."
    else
      puts "IR:"
      ires = gets.to_f
      ir = "IR: #{ires}."
    end 
    
    i += 1
    nod_num += 1
    
    nodulo = "- N#{nod_num}: nódulo localizado no #{topo_choice}, medindo #{medida_l} x #{medida_ap} x #{medida_t} cm, com volume nodular de #{nod_vol.ceil(2)} ml, #{comp_nod_choice}, #{eco_nod_choice}, com #{forma_nod_choice} e #{margem_nod_choice}, #{focos_nod_choice}. #{chammas_choice}#{ir} ACR-TIRADS #{tr}."
    nodulos << nodulo
  end
end

# Laudo:
puts "
Nome: #{nome}
Data de nascimento: #{dta_nas}
Data do exame: #{dt_im}

ULTRASSONOGRAFIA DA TIREOIDE

TÉCNICA:
Exame realizado com transdutor linear de alta frequência. 

RELATÓRIO:
Tireoide tópica, de dimensão #{volume} e contornos regulares. Parênquima com ecotextura #{gland}, #{pres_nod}. 

BIOMETRIA:
Lobo direito: #{ltd_l} x #{ltd_ap} x #{ltd_t} cm, com volume de #{ltd_vol.ceil(2)} ml
Lobo esquerdo: #{lte_l} x #{lte_ap} x #{lte_t} cm, com volume de #{lte_vol.ceil(2)} ml
istmo: #{istmo}
Volume total: #{gl_volume.ceil(2)} ml

"
nodulos.each do |nodulo|
  puts nodulo
end

# Conclusão
puts
puts "Impressão diagnóstica: "
if asp_gl == 0 && gl_volume >= 5 and gl_volume <= 15 && ha_nod == "n"
  puts "- Glândula tireoide de aspecto ecográfico normal."
elsif asp_gl == 1 && ha_nod == "n"
  puts "- Glândula tireoide com ecotextura heterogênea sugestivo de tireoidite, sem delimitar nódulos verdadeiros."
elsif asp_gl == 1 && ha_nod == "y" && qdd_nod > 1
  puts "- Glândula tireoide com ecotextura heterogênea sugestivo de tireoidite, com a presença dos nódulos descritos acima."
elsif asp_gl == 1 && ha_nod == "y" && qdd_nod == 1
  puts "- Glândula tireoide com ecotextura heterogênea sugestivo do tireoidite, com a presença do nódulo descrito acima."
elsif asp_gl == 0 && ha_nod == "y" && qdd_nod > 1
  puts "- Glândula tireoide com ecotextura homogênea, com a presença dos nódulos descritos acima."
elsif asp_gl == 0 && ha_nod == "y" && qdd_nod == 1
  puts "- Glândula tireoide com ecotextura homogênea, com a presença do nódulo descrito acima."
end


